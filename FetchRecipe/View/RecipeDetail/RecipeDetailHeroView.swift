//
//  HeroView.swift
//  FetchRecipe
//
//  Created by James Layton on 11/8/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipeDetailHeroView: View {

    let youtubeUrl: URL?
    let photoUrlLarge: URL?
    let thumbnailUrl: URL?

    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        ZStack {
            if let youtubeUrl = youtubeUrl, let thumbnailUrl = thumbnailUrl {
                WebImage(url: thumbnailUrl) { webImage in
                    webImage
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .cornerRadius(10)
                        .shadow(color: shadowColor, radius: 2)
                        .overlay(playButtonOverlay)
                        .onTapGesture {
                            UIApplication.shared.open(youtubeUrl)
                        }
                } placeholder: {
                    fallbackImage
                }
            } else {
                fallbackImage
            }
        }
    }

    // MARK: - Subviews

    private var playButtonOverlay: some View {
        Image(systemName: "play.circle.fill")
            .font(.system(size: 50))
            .foregroundColor(.white)
            .shadow(radius: 10)
    }

    private var fallbackImage: some View {
        Group {
            if let photoUrlLarge = photoUrlLarge {
                WebImage(url: photoUrlLarge)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .cornerRadius(10)
                    .shadow(color: shadowColor, radius: 2)
            } else {
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .cornerRadius(10)
                    .foregroundColor(.gray)
                    .shadow(color: shadowColor, radius: 2)
            }
        }
    }

    private var shadowColor: Color {
        colorScheme == .dark ? Color.white.opacity(0.5) : Color.black.opacity(0.5)
    }
}

struct RecipeDetailHeroView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeDetailHeroView(youtubeUrl: mockRecipe.youtubeUrl,
                                 photoUrlLarge: mockRecipe.photoUrlLarge,
                                 thumbnailUrl: mockRecipe.youtubeThumbnailUrl)
            .environmentObject(MockRecipeListViewModel(mockDataType: .correctData))
            .previewDisplayName("Light Mode")
            .preferredColorScheme(.light)
            
            RecipeDetailHeroView(youtubeUrl: mockRecipe.youtubeUrl,
                                 photoUrlLarge: mockRecipe.photoUrlLarge,
                                 thumbnailUrl: mockRecipe.youtubeThumbnailUrl)
            .environmentObject(MockRecipeListViewModel(mockDataType: .correctData))
            .previewDisplayName("Dark Mode")
            .preferredColorScheme(.dark)
        }
    }
}
