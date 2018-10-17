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
    
    //MARK: - IBOutlets
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = viewModel.name
        genreLabel.text = viewModel.genre
        dateLabel.text = viewModel.date
        overviewTextView.text = viewModel.overview
        
        backdropImage.dowloadFromServer(link: viewModel.imageUrl, contentMode: .scaleAspectFill)
        backdropImage.clipsToBounds = true
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

