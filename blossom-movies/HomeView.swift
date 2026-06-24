//
//  HomeView.swift
//  blossom-movies
//
//  Created by Mahasvin Shanmugapriya Manikandan on 5/16/26.
//

import SwiftUI

struct HomeView: View {
    var heroTestTitle = Constants.testTitleURL
    let viewModel = ViewModel()
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                // view model
                switch viewModel.homeStatus {
                case .notStarted:
                    EmptyView()
                case .fetching:
                    ProgressView()
                        .frame(width: geo.size.width, height: geo.size.height)
                case .success:
                    LazyVStack {
                        // Opening image
                        AsyncImage(url: URL(string: heroTestTitle)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .overlay {
                                    LinearGradient(
                                        stops: [
                                            Gradient.Stop(color: .clear, location: 0.8),
                                            Gradient.Stop(color: .gradient, location: 1)
                                        ],
                                        startPoint: .top,
                                        endPoint: .bottom)
                                }
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: geo.size.width, height: geo.size.height * 0.85)
                        
                        // Home page buttons
                        HStack {
                            Button {
                            } label: {
                                Text(Constants.playString)
                                    .ghostButton()
                            }
                            
                            Button {
                            } label: {
                                Text(Constants.downloadString)
                                    .ghostButton()
                            }
                        }
                        
                        // Scrollable
                        HorizontalListView(header: Constants.trendingMovesString, titles: viewModel.trendingMovies)
                        HorizontalListView(header: Constants.trendingTVString, titles: viewModel.trendingTV)
                        HorizontalListView(header: Constants.topRatedMovieString, titles: viewModel.topRatedMovies)
                        HorizontalListView(header: Constants.topRatedTVString, titles: viewModel.topRatedTV)
                    }
                case .failed(let error):
                    Text("Error: \(error.localizedDescription)")
                }
            }
            .task {
                await viewModel.getTitles()
            }
        }
    }
}

#Preview {
    HomeView()
}
