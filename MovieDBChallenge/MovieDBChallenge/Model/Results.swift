//
//  Results.swift
//  MovieDBChallenge
//
//  Created by Gabriel Paul on 17/10/18.
//  Copyright © 2018 gp. All rights reserved.
//

import Foundation

struct APIResults: Decodable {
    let page: Int
    let totalResults: Int
    let totalPages:Int
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case page, totalResults, totalPages, movies = "results"
    }
}
