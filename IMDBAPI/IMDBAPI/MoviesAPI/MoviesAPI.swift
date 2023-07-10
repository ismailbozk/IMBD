//
//  MoviesAPI.swift
//  IMDBAPI
//
//  Created by Ismail Bozkurt on 10/07/2023.
//

import Foundation

public final class MovieAPI {
    public class func movieSearch(query: String) async throws -> GETMovieSearchResponse {
        let rule = GETMovieSearchRule(query: query)
        return try await APIClient.perform(with: rule)
    }
}
