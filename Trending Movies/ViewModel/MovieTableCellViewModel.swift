//
//  MovieTableCellViewModel.swift
//  Trending Movies
//
//  Created by Mohamed on 29/11/2023.
//

import UIKit

class MovieTableCellViewModel{
    var id: Int
    var title: String
    var date: String
    var rating: String
    var imageUrl: URL?
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.name ?? movie.title ?? ""
        self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
        self.rating = "\(movie.voteAverage)/10"
        self.imageUrl = makeImageUrl(movie.posterPath ?? "")
    }
    private func makeImageUrl(_ imgcode: String) -> URL{
        return URL(string: "\(NetworkConstants.shared.imageServerAddress)\(imgcode)")!
    }
}
