//
//  HomeView.swift
//  blossom-movies
//
//  Created by Mahasvin Shanmugapriya Manikandan on 5/16/26.
//

import SwiftUI

struct HomeView: View {
    var heroTestTitle = Constants.testTitleURL
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
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
                    HorizontalListView(header: Constants.trendingMovesString)
                    HorizontalListView(header: Constants.trendingTVString)
                    HorizontalListView(header: Constants.topRatedMovieString)
                    HorizontalListView(header: Constants.topRatedTVString)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
