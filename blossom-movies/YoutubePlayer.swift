//
//  YoutubePlayer.swift
//  blossom-movies
//
//  Created by Mahasvin Shanmugapriya Manikandan on 6/29/26.
//

import SwiftUI
import WebKit

struct YoutubePlayer: UIViewRepresentable {
    let webView = WKWebView()
    let videoId: String
    let youtubeBaseURL = APIConfig.shared?.youtubeBaseURL
    
}
