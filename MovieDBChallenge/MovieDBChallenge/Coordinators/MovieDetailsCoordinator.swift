//
//  MovieDetailsCoordinator.swift
//  MovieDBChallenge
//
//  Created by Gabriel Paul on 17/10/18.
//  Copyright © 2018 gp. All rights reserved.
//

import UIKit

class MovieDetailsCoordinator: Coordinator {
    
    fileprivate let presenter: UINavigationController
    var childrenCoordinators: [Coordinator]
    
    fileprivate let movie: Movie
    fileprivate var movieDetailsViewController: MovieDetailsViewController?
    
    init(presenter: UINavigationController, movie: Movie) {
        self.presenter = presenter
        self.movie = movie
        self.childrenCoordinators = []
    }
    
    func start() {
        let movieDetailsViewController = MovieDetailsViewController.instantiate()
        let movieDetailsViewModel = MovieDetailsViewModel(movie: movie)
        movieDetailsViewController.viewModel = movieDetailsViewModel
        
        self.movieDetailsViewController = movieDetailsViewController
        presenter.pushViewController(movieDetailsViewController, animated: true)
    }
}
