//
//  World+API.swift
//  MovieSearch
//
//  Created by Ismail Bozkurt on 10/07/2023.
//

import Foundation
import IMDBAPI

protocol MovieAPIProtocol {
    func movieSearch(query: String) async throws -> GETMovieSearchResponse
}

extension World {

    struct MovieAPI: MovieAPIProtocol {
        func movieSearch(query: String) async throws -> GETMovieSearchResponse {
            try await IMDBAPI.MovieAPI.movieSearch(query: query)
        }
    }
}
