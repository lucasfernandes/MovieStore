//
//  MovieListView.swift
//  movies
//
//  Created by Lucas Silveira on 13/07/20.
//

import SwiftUI

struct MovieListView: View {
    @Environment(\.self) var environment
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        NavigationView {
            List(self.viewModel.movies) { movie in
                HStack {
                    Text(movie.fullTitle)
                    Spacer()
                    Text(movie.givenRating.localizedName)
                }
            }
            .navigationBarTitle("Movies")
            .navigationBarItems(trailing: navigationBarTrailingItem)
        }
    }

    private var navigationBarTrailingItem: some View {
        Button(action: {
            self.viewModel.isPresentingAddMovie = true
        }, label: {
            Image(systemName: "plus").frame(minWidth: 32, minHeight: 32)
        }).sheet(isPresented: self.$viewModel.isPresentingAddMovie) {
            self.makeAddMovieView()
        }
    }

    private func makeAddMovieView() -> AddMovieView {
        let movieStore = environment[MovieStoreKey]
        let viewModel = AddMovieView.ViewModel(movieStore: movieStore)
        return AddMovieView(viewModel: viewModel)
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(viewModel: MovieListView.ViewModel(movieStore: MovieStore()))
    }
}
