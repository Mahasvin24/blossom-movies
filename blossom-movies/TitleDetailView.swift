//
//  TitleDetailView.swift
//  blossom-movies
//
//  Created by Mahasvin Shanmugapriya Manikandan on 6/24/26.
//

import SwiftUI

struct TitleDetailView: View {
    let title: Title
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                LazyVStack(alignment: .leading) {
                    // movie poster image
                    AsyncImage(url: URL(string: title.posterPath ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: geo.size.width, height: geo.size.height * 0.85)
                    
                    Text(title.name ?? title.title ?? "")
                        .bold()
                        .font(.title2)
                        .padding(.horizontal, 10)
                        .padding(.bottom, 4)
                    
                    Text(title.overview ?? "")
                        .padding(.horizontal, 10)
                }
            }
        }
    }
}

#Preview {
    TitleDetailView(title: Title.previewTitles[0])
}
