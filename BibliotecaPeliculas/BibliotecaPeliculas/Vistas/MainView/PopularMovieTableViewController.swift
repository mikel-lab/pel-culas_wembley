//
//  ViewController.swift
//  BibliotecaPeliculas
//
//  Created by Mikel Cobian on 14/4/22.
//

import UIKit
import Kingfisher

class PopularMovieTableViewController: UIViewController {
    
    var movies: [Result] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    @IBOutlet weak var tableView: UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView?.dataSource = self
        tableView?.delegate = self
        
        getPopularMovies()
    }
    
    func getPopularMovies(){
        NetworkingProvider.shared.getPopularMovies { movies in
            print(movies)
            self.movies = movies
        } failure: { error in
            print(error ?? "Ha habido un error")
        }
        
    }
    
}

extension PopularMovieTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PopularMovieTableViewCell",
                                                       for: indexPath) as? PopularMovieTableViewCell else {return UITableViewCell()}
        
        if movies.count > indexPath.row {
            let movie = movies[indexPath.row]
    
            cell.configureViews(image: movie.backdropPath,
                                title: movie.title,
                                description: movie.overview)
        }
        
        return cell
    }
    
   
    
}

extension PopularMovieTableViewController: UITableViewDelegate {
    
}
