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
    
    //TODO: Genre
    var genre: String { return String(movie.genreIds.first!) }
    
    var releaseDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd"
        let date = dateFormatter.date(from: movie.releaseDate) ?? Date()
        dateFormatter.dateFormat = "yyyy MMMM dd"
        return dateFormatter.string(from: date)
    }
    
    var imageUrl: String {
        return "http://image.tmdb.org/t/p/w185\(movie.posterPath!)"
    }
    
    init(movie: Movie) {
        self.movie = movie
    }
}
