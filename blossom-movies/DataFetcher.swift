//
//  DataFetcher.swift
//  blossom-movies
//
//  Created by Mahasvin Shanmugapriya Manikandan on 6/19/26.
//

import Foundation

struct DataFetcher {
    let tmdbBaseURL = APIConfig.shared?.tmdbBaseURL
    let tmdbAPIKey = APIConfig.shared?.tmdbAPIKey
    
    func fetchTitles(for media: String, by type: String) async throws -> [Title] {
        // create URL
        guard let fetchTitlesURL = try buildURL(media: media, type: type) else {
            throw NetworkError.urlBuildFailed
        }
        
        print(fetchTitlesURL) // for debug
        
        // API Call
        let (data, urlResponse) = try await URLSession.shared.data(from: fetchTitlesURL)
        
        // Response error handling
        guard let response = urlResponse as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badURLResponse(underlyingError: NSError(
                domain: "DataFetcher",
                code: (urlResponse as? HTTPURLResponse)?.statusCode ?? -1,
                userInfo: [NSLocalizedDescriptionKey: "Invalid HTTP Response"]
            ))
        }
        
        // decode
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase // here b/c we use camel case but API uses snake case
        var titles = try decoder.decode(APIObject.self, from: data).results
        Constants.addPosterPath(to: &titles)
        
        return titles
    }
    
    private func buildURL(media: String, type: String) throws -> URL? {
        // config
        guard let baseURL = tmdbBaseURL else {
            throw NetworkError.missingConfig
        }
        guard let apiKey = tmdbAPIKey else {
            throw NetworkError.missingConfig
        }
        
        var path: String
        
        switch type {
        case "trending":
            path = "3/trending/\(media)/day"
        case "top_rated":
            path = "3/\(media)/top_rated"
        default:
            throw NetworkError.urlBuildFailed
        }
        
        guard let url = URL(string: baseURL)?
            .appending(path: path)
            .appending(queryItems: [
                URLQueryItem(name: "api_key", value: apiKey)
            ]) else {
            throw NetworkError.urlBuildFailed
        }
        
        return url
    }
}
