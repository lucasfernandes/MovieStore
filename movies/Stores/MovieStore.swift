//
//  MovieStore.swift
//  movies
//
//  Created by Lucas Silveira on 13/07/20.
//

import Foundation

import Combine
import SwiftUI

final class MovieStore {
    @Published private(set) var allMovies: [Movie] = []

    func add(_ movie: Movie) {
        allMovies.append(movie)
    }
}

struct MovieStoreKey: EnvironmentKey {
    typealias Value = MovieStore
    static var defaultValue = MovieStore()
}

extension EnvironmentValues {
    var movieStore: MovieStore {
        get { return self[MovieStoreKey] }
        set { self[MovieStoreKey] = newValue }
    }
}
