//
//  MovieDetail.swift
//  MovieSearch
//
//  Created by Ismail Bozkurt on 27/09/2023.
//

import SwiftUI
import IMDBAPI

struct MovieDetailView: View {
    let movie: Movie

    var body: some View {
        GeometryReader { geo in
            VStack {
                AsyncImage(url: movie.posterUrl) { image in
                    image.resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }.frame(width: geo.size.width, height: geo.size.height/2)
                Text(movie.title).font(Font.headline)
                Text(movie.overview).font(Font.body)
                Spacer()
            }
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static let movie = Movie(id: 1, title: "Batman", overview: "Details \nmore details", posterPath: "somepath")
    static var previews: some View {
        MovieDetailView(movie: movie)
    }
}
