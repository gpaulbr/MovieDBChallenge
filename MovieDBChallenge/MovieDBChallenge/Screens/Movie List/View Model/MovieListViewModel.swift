//
//  MovieListViewModel.swift
//  MovieDBChallenge
//
//  Created by Gabriel Paul on 17/10/18.
//  Copyright © 2018 gp. All rights reserved.
//

import Foundation

protocol MovieListViewModelUIDelegate: class {
    func movieListViewModelDidUpdate(_ movieListViewModel: MovieListViewModel)
}

class MovieListViewModel {
    private var movies: [Movie]
    
    weak var UIDelegate: MovieListViewModelUIDelegate?
    
    var numberOfRows: Int {
        return movies.count
    }
    
    init() {
        movies = []
        APIManager.shared.getUpcomingMovies(pageNumber: 1, completion: { (moviesQuerry) in
            self.movies = moviesQuerry
            print(self.movies)
            self.UIDelegate?.movieListViewModelDidUpdate(self)
        })
    }
    
    func movie(for indexPath: IndexPath) -> Movie {
        return movies[indexPath.row]
    }
    
    func movieCellViewModel(for indexPath: IndexPath) -> MovieCellViewModel {
        let movie = movies[indexPath.row]
        let viewModel = MovieCellViewModel.init(movie: movie)
        return viewModel
    }
}
