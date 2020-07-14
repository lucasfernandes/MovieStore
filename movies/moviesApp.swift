//
//  moviesApp.swift
//  movies
//
//  Created by Lucas Silveira on 13/07/20.
//

import SwiftUI

@main
struct moviesApp: App {
    private let movieStore: MovieStore
    private let viewModel: MovieListView.ViewModel

    init() {
        movieStore = MovieStore()
        viewModel = MovieListView.ViewModel(movieStore: movieStore)
    }

    var body: some Scene {
        WindowGroup {
            MovieListView(viewModel: viewModel).environment(\.movieStore, movieStore)
        }
    }
}
