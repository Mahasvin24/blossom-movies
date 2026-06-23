//
//  Constants.swift
//  blossom-movies
//
//  Created by Mahasvin Shanmugapriya Manikandan on 5/16/26.
//

import Foundation
import SwiftUI

struct Constants {
    // Strings
    static let homeString = "Home"
    static let upcomingString = "Upcoming"
    static let searchString = "Search"
    static let downloadString = "Download"
    static let playString = "Play"
    static let trendingMovesString = "Trending Movies"
    static let trendingTVString = "Trending TV"
    static let topRatedMovieString = "Top Rated Movies"
    static let topRatedTVString = "Top Rated TV"
    
    // Icons
    static let homeIconString = "house"
    static let upcomingIconString = "play.circle"
    static let searchIconString = "magnifyingglass"
    static let downloadsIconString = "arrow.down.to.line"
    
    // Test Titles
    static let testTitleURL = "https://image.tmdb.org/t/p/w500/nnl6OWkyPpuMm595hmAxNW3rZFn.jpg"
    static let testTitleURL2 = "https://image.tmdb.org/t/p/w500/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg"
    static let testTitleURL3 = "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg"
    static let posterURLStart = "https://image.tmdb.org/t/p/w500/"
    static func addPosterPath(to titles: inout[Title]) {
        for i in titles.indices {
            if let path = titles[i].posterPath {
                titles[i].posterPath = Constants.posterURLStart + path
            }
        }
    }
    
    
}

extension Text {
    func ghostButton() -> some View {
        self
            .frame(width: 100, height: 50)
            .foregroundStyle(.buttonText)
            .bold()
            .background {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(.buttonBorder, lineWidth: 5)
            }
    }
}
