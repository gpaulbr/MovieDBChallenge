//
//  Movie.swift
//  MovieDBChallenge
//
//  Created by Gabriel Paul on 17/10/18.
//  Copyright © 2018 gp. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    let title: String
    let posterPath: String?
    let backdropImageUrl: String?
    let genreIds: [Int]
    let releaseDate: String
    let overview: String
}
