//
//  MovieCellViewModel.swift
//  MovieDBChallenge
//
//  Created by Gabriel Paul on 17/10/18.
//  Copyright © 2018 gp. All rights reserved.
//

import Foundation

class MovieCellViewModel {
    
    private let movie: Movie
    
    var title: String { return movie.title }
    
    var genre: String {
        var string = ""
        movie.genreIds.forEach { (id) in
            if let element = GenresSingleton.shared.genres.first(where: {
                $0.id == id }) {
                    string.append(element.name)
                    string.append(" ")
            }
        }
        return string
    }
    
    var releaseDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd"
        let date = dateFormatter.date(from: movie.releaseDate) ?? Date()
        dateFormatter.dateFormat = "yyyy MMMM dd"
        return dateFormatter.string(from: date)
    }
    
    var imageUrl: String {
        guard let path = movie.posterPath else {
            return "https://www.rvroundtable.com/wp-content/uploads/revslider/home5/placeholder-1200x500.png"
        }
        
        return "http://image.tmdb.org/t/p/w185\(path)"
    }
    
    init(movie: Movie) {
        self.movie = movie
    }
}
