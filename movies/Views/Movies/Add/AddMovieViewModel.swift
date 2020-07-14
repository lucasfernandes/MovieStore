//
//  AddMovieViewModel.swift
//  movies
//
//  Created by Lucas Silveira on 13/07/20.
//

import Combine
//import SwiftUI

extension AddMovieView {
    class ViewModel: ObservableObject {
        private let movieStore: MovieStore

        init(movieStore: MovieStore) {
            self.movieStore = movieStore
        }

        @Published private var newMovie = Movie(fullTitle: "")

        var title: String {
            get { self.newMovie.fullTitle }
            set { self.newMovie.fullTitle = newValue }
        }

        var rating: Movie.Rating {
            get { self.newMovie.givenRating }
            set { self.newMovie.givenRating = newValue}
        }



//        lazy var title = Binding<String>(get: {
//            self.newMovie.fullTitle
//        }, set: {
//            self.newMovie.fullTitle = $0
//        })

//        lazy var rating = Binding<Movie.Rating>(get: {
//            self.newMovie.givenRating
//        }, set: {
//            self.newMovie.givenRating = $0
//        })

        var canSave: Bool {
            return !newMovie.fullTitle.isEmpty
        }

        func save() {
            if canSave {
                movieStore.add(newMovie)
            }
        }
    }
}
