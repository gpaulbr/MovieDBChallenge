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
    
    init(presenter: UINavigationController, movie: Movie) {
        self.presenter = presenter
        self.movie = movie
        self.childrenCoordinators = []
    }
    
    func start() {
        
    }
}
