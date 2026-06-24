//
//  ViewModel.swift
//  blossom-movies
//
//  Created by Mahasvin Shanmugapriya Manikandan on 6/21/26.
//

import Foundation

@Observable
class ViewModel {
    enum FetchStatus {
        case notStarted
        case fetching
        case success
        case failed(underlyingError: Error)
    }
    
    private(set) var homeStatus: FetchStatus = .notStarted
    private let dataFetcher = DataFetcher()
    var trendingMovies: [Title] = []
    var trendingTV: [Title] = []
    var topRatedMovies: [Title] = []
    var topRatedTV: [Title] = []
    
    func getTitles() async {
        homeStatus = .fetching
        
        do {
            async let tMovies = dataFetcher.fetchTitles(for: "movie", by: "trending")
            async let tTV = dataFetcher.fetchTitles(for: "tv", by: "trending")
            async let trMovies = dataFetcher.fetchTitles(for: "movie", by: "top_rated")
            async let trTV = dataFetcher.fetchTitles(for: "tv", by: "top_rated")
            
            trendingMovies = try await tMovies
            trendingTV = try await tTV
            topRatedMovies = try await trMovies
            topRatedTV = try await trTV
            
            homeStatus = .success
        } catch {
            print(error)
            homeStatus = .failed(underlyingError: error)
        }
        
        return
    }
}
