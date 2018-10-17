//
//  ViewController.swift
//  MovieDBChallenge
//
//  Created by Gabriel Paul on 17/10/18.
//  Copyright © 2018 gp. All rights reserved.
//

import UIKit

protocol MovieListDelegate: class {
    func movieList(_ movieListViewController: MovieListViewController, didClick movie: Movie)
}

class MovieListViewController: UIViewController {

    @IBOutlet weak var moviesTableView: UITableView!
    
    var viewModel: MovieListViewModel!
    weak var delegate: MovieListDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.UIDelegate = self
        
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        
        moviesTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieCell")
        
        self.navigationItem.title = "Upcoming Movies"
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
            tableView.dequeueReusableCell(
                withIdentifier: MovieTableViewCell.identifier,
                for: indexPath) as? MovieTableViewCell else {
                    return UITableViewCell()
        }
        
        let movieCellViewModel = self.viewModel.movieCellViewModel(for: indexPath)
        
        cell.configure(with: movieCellViewModel)
        return cell
    }
    
    
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.movieList(self, didClick: viewModel.movie(for: indexPath))
    }
}

extension MovieListViewController: MovieListViewModelUIDelegate {
    func movieListViewModelDidUpdate(_ movieListViewModel: MovieListViewModel) {
        moviesTableView.reloadData()
    }
}

extension MovieListViewController: StoryboardInstantiable {
    static var viewControllerID: String {
        return "MovieListViewController"
    }
    
    static var storyboardIdentifier: String {
        return "MovieList"
    }
}
