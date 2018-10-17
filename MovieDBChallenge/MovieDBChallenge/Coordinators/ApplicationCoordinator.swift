//
//  ApplicationCoordinator.swift
//  MovieDBChallenge
//
//  Created by Gabriel Paul on 17/10/18.
//  Copyright © 2018 gp. All rights reserved.
//

import Foundation
import UIKit

class ApplicationCoordinator: Coordinator {
    public var childrenCoordinators: [Coordinator]
    private let window: UIWindow
    private let rootViewController: UINavigationController
    //model
    
    init(window: UIWindow) {
        self.window = window
        self.rootViewController = UINavigationController()
        self.childrenCoordinators = []
        
        configureNavigationController()
    }
    
    private func configureNavigationController() {
        rootViewController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        rootViewController.navigationBar.shadowImage = UIImage()
        rootViewController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationBar.isTranslucent = true
        rootViewController.view.backgroundColor = .clear
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        showMovieList()
        UITextField.appearance().keyboardAppearance = .light
    }
    
    private func showMovieList() {
        let movieListCoordinator = MovieListCoordinator(presenter: rootViewController)
        addChild(coordinator: movieListCoordinator)
        movieListCoordinator.start()
    }
}
