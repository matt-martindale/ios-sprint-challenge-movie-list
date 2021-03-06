//
//  MovieListViewController.swift
//  Movie List
//
//  Created by Matthew Martindale on 2/8/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var movieTableView: UITableView!

    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.movieTableView.delegate = self
        self.movieTableView.dataSource = self
    }
}

extension MovieListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = movieTableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as?
            MovieTableViewCell else { return UITableViewCell()}
        
        let movie = movies[indexPath.row]
        cell.movie = movie
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            movies.remove(at: indexPath.row)
//
//            movieTableView.beginUpdates()
//            movieTableView.deleteRows(at: [indexPath], with: .automatic)
//            movieTableView.endUpdates()
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddMovieSegue" {
            let addMovieVC = segue.destination as! AddMovieViewController
            addMovieVC.movieDelegate = self
        }
//        } else if segue.identifier == "EditMovieSegue" {
//            let editMovieVC = segue.destination as! AddMovieViewController
//            editMovieVC.
//        }
    }
}

extension MovieListViewController: AddMovieDelegate {
    func addMovie(_ movie: Movie) {
        movies.append(movie)
        movieTableView.reloadData()
    }
}

//extension MovieListViewController: MovieTableViewCellDelegate {
//    func editButtonTapped(_ onCell: MovieTableViewCell) {
//        <#code#>
//    }


