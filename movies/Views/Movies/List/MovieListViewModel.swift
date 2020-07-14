//
//  MovieListViewModel.swift
//  movies
//
//  Created by Lucas Silveira on 13/07/20.
//

import Combine
import SwiftUI

extension MovieListView {
    final class ViewModel: ObservableObject {
        private let movieStore: MovieStore
        private var cancellables: [AnyCancellable] = []

        init(movieStore: MovieStore) {
            self.movieStore = movieStore
            cancellables.append(movieStore.$allMovies.assign(to: \.movies, on: self))
        }

        @Published private(set) var movies: [Movie] = []
        @Published var isPresentingAddMovie = false
    }
}
