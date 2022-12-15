//
//  Movie.swift
//  Movie API TRUNG
//
//  Created by trung on 14/12/2022.
//

import Foundation

struct Movie {
    let title: String?
    let popular: String?
    let rating: String?
    let overview: String?
    let posterImage: String?
    
    init(title: String?, popular: String?, rating: String?, overview: String?, posterImage: String?) {
        self.title = title
        self.popular = popular
        self.rating = rating
        self.overview = overview
        self.posterImage = posterImage
    }
    
    var imageWide: String{
        return (posterImage ?? "") + "-wide.jpg"
    }
}
