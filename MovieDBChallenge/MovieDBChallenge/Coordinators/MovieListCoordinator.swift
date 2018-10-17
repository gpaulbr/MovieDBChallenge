//
//  MovieListCoordinator.swift
//  MovieDBChallenge
//
//  Created by Gabriel Paul on 17/10/18.
//  Copyright © 2018 gp. All rights reserved.
//

import Foundation
import UIKit

class MovieListCoordinator: Coordinator {
    
    var childrenCoordinators: [Coordinator]
    
    private let presenter: UINavigationController
    private var movieListViewController: MovieListViewController?
    
    init (presenter: UINavigationController) {
        self.presenter = presenter
        self.childrenCoordinators = []
    }
    
    func start() {
        let movieListViewController = MovieListViewController.instantiate()
        let movieListViewModel = MovieListViewModel()
        movieListViewController.viewModel = movieListViewModel
        
        self.movieListViewController = movieListViewController
        presenter.pushViewController(movieListViewController, animated: false)
    }
}
