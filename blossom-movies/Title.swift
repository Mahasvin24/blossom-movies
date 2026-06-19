//
//  Title.swift
//  blossom-movies
//
//  Created by Mahasvin Shanmugapriya Manikandan on 5/30/26.
//

import Foundation

struct APIObject: Decodable {
    var results: [Title] = []
}

struct Title: Decodable, Identifiable {
    var id: Int?
    var title: String?
    var name: String?
    var overview: String?
    var posterPath: String?
}
