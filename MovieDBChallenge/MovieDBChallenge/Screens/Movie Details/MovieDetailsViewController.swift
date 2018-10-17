//
//  MovieDetailsViewController.swift
//  MovieDBChallenge
//
//  Created by Gabriel Paul on 17/10/18.
//  Copyright © 2018 gp. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var viewModel: MovieDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension MovieDetailsViewController: StoryboardInstantiable {
    static var viewControllerID: String {
        return "MovieDetailsViewController"
    }
    
    static var storyboardIdentifier: String {
        return "MovieDetails"
    }
}

