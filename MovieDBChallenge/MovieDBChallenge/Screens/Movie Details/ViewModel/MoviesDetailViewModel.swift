//
//  MoviesDetailViewModel.swift
//  MovieDBChallenge
//
//  Created by Gabriel Paul on 17/10/18.
//  Copyright © 2018 gp. All rights reserved.
//

import Foundation

class MovieDetailsViewModel {
    
    private var movie: Movie
    
    var name: String { return movie.title }
    //TODO: genre
    var genre: String { return String(movie.genreIds.first!) }
    
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd"
        let date = dateFormatter.date(from: movie.releaseDate) ?? Date()
        dateFormatter.dateFormat = "yyyy MMMM dd"
        return dateFormatter.string(from: date)
    }
    
    var imageUrl: String {
        guard let path = movie.backdropPath else {
            return "https://www.rvroundtable.com/wp-content/uploads/revslider/home5/placeholder-1200x500.png"
        }
        return "http://image.tmdb.org/t/p/w780\(path)"
    }
    
    var overview: String {
        return movie.overview
    }
    
    init(movie: Movie) {
        self.movie = movie
    }
}
