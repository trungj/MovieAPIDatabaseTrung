//
//  MoviesTableViewController.swift
//  Movie API TRUNG
//
//  Created by trung on 14/12/2022.
//

import UIKit
import Alamofire

class MoviesTableViewController: UIViewController {

    var movies = [Movie]()
  
    /// Khởi url session
    let session = URLSession.shared
    
    
    @IBOutlet weak var uiTableView: UITableView!
    
    
    private var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.uiTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        
        uiTableView.delegate = self
        uiTableView.dataSource = self

        getData()
    }
    
    private func getData() {
        /// Step 1: Xác định domain của API
        let domain = "https://api.themoviedb.org/3/movie/popular?api_key=9898481a3f1be7af154c4d55fa677cc1&language=en-US&page=1"
        
        AF.request(domain).response { afDataRes in
            DispatchQueue.main.async {
                let result = afDataRes.result
                switch result {
                case .success(let data):
                    defer {
                       
                    }
                    
                    guard let data = data else {
                        return
                    }
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)
                        
                        if let dataJson = json as? [[String: Any]] {
                            let models = dataJson.map { data -> Movie in
                                let title = data["title"] as? String ?? ""
                                let popular = data["popularity"] as? String ?? ""
                                let rating = data["vote_average"] as? String ?? ""
                                let overview = data["overview"] as? String ?? ""
                                let posterImage = data["poster_path"] as? String ?? ""
                                let movie = Movie(title: title, popular: popular, rating: rating, overview: overview, posterImage: posterImage)
                                return movie
                            }
                            self.movies.append(contentsOf: models)
                            self.uiTableView.reloadData()
                            
                        }
                        
                    } catch {
                        print(error)
                    }
                case .failure(let error):
                    print("Alert looix tai day \(error)")
                    
                }
                print(afDataRes)
            }
        }
    }
    
    

}

extension MoviesTableViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = self.movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        cell.lblTitle.text = movie.title
        cell.lblPopular.text = movie.popular
        cell.lblRating.text = movie.rating
        cell.lblSummary.text = movie.overview
        cell.posterImage.image = UIImage(named: movie.imageWide)
        
        return cell
    }
    
    
}
