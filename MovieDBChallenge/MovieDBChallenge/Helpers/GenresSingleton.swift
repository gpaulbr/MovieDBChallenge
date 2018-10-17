//
//  GenresSingleton.swift
//  MovieDBChallenge
//
//  Created by Gabriel Paul on 17/10/18.
//  Copyright © 2018 gp. All rights reserved.
//

import Foundation

class GenresSingleton {
    static let shared = GenresSingleton()
    
    var genres: [Genre] = []
}
