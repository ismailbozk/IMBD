//
//  Movie+Poster.swift
//  MovieSearch
//
//  Created by Ismail Bozkurt on 27/09/2023.
//

import Foundation
import IMDBAPI

extension Movie {
    var posterUrl: URL? {
        posterPath.flatMap { URL(string: "https://image.tmdb.org/t/p/w500/" + $0) }
    }
}
