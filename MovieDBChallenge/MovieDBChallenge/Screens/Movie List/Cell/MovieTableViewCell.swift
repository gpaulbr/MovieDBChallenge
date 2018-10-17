//
//  MovieCell.swift
//  MovieDBChallenge
//
//  Created by Gabriel Paul on 17/10/18.
//  Copyright © 2018 gp. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    static let identifier = "movieCell"
    
    private var viewModel: MovieCellViewModel!
    
    //MARK: - IBOutlets
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configure(with viewModel: MovieCellViewModel) {
        self.viewModel = viewModel
        nameLabel.text = viewModel.title
        genreLabel.text = viewModel.genre
        releaseDateLabel.text = viewModel.releaseDate
        
        posterImage.dowloadFromServer(link: viewModel.imageUrl)
    }
}
