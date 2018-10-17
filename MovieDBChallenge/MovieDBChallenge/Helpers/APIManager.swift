//
//  APIManager.swift
//  MovieDBChallenge
//
//  Created by Gabriel Paul on 17/10/18.
//  Copyright © 2018 gp. All rights reserved.
//

import Foundation

public class APIManager {
    
    static let shared: APIManager = APIManager()
    
    func getUpcomingMovies(pageNumber: Int, completion: @escaping (([Movie]) -> Void)) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.themoviedb.org"
        urlComponents.path = "/3/movie/upcoming"
        
        let apiKey = URLQueryItem(name: "api_key", value: "c5850ed73901b8d268d0898a8a9d8bff")
        let page = URLQueryItem(name: "page", value: String(pageNumber))
        
        urlComponents.queryItems = [apiKey, page]
        
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        _ = session.dataTask(with: url) { (responseData, response, responseError) in
            DispatchQueue.main.async {
                if let error = responseError {
                    print(error)
                } else if let jsonData = responseData {
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        
                        let apiResults: APIResults = try decoder.decode(APIResults.self, from: jsonData)
                        completion(apiResults.movies)
                    } catch let jsonError {
                        print(responseError ?? "response data unable to generate a movies list \(jsonError)")
                    }
                }
            }
        }.resume()
    }
    
    func getGenres(completion: @escaping ((Genres) -> Void)) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.themoviedb.org"
        urlComponents.path = "/3/genre/movie/list"
        
        let apiKey = URLQueryItem(name: "api_key", value: "c5850ed73901b8d268d0898a8a9d8bff")
        
        urlComponents.queryItems = [apiKey]
        
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        _ = session.dataTask(with: url) { (responseData, response, responseError) in
            DispatchQueue.main.async {
                if let error = responseError {
                    print(error)
                } else if let jsonData = responseData {
                    do {
                        let decoder = JSONDecoder()
                        let genres: Genres = try decoder.decode(Genres.self, from: jsonData)
                        completion(genres)
                    } catch let jsonError {
                        print(responseError ?? "response data unable to generate a genre list \(jsonError)")
                    }
                }
            }
        }.resume()
    }
}
