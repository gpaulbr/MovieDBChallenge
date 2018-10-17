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
    private var movies: [Movie] = []
    private var pageNumber = 1
    private var pageNumberMax = 20
    
    weak var UIDelegate: MovieListViewModelUIDelegate?
    
    var numberOfRows: Int {
        return movies.count
    }
    
    init() {
        getMoreMovies()
    }
    
    func getMoreMovies() {
        guard pageNumber <= pageNumberMax else { return }
        APIManager.shared.getUpcomingMovies(pageNumber: pageNumber, completion: { (moviesQuerry) in
            self.movies.append(contentsOf: moviesQuerry)
            self.UIDelegate?.movieListViewModelDidUpdate(self)
        })
        pageNumber += 1
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
