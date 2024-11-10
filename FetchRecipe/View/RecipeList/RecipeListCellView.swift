//
//  RecipeListCellView.swift
//  FetchRecipe
//
//  Created by James Layton on 11/7/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipeListCellView: View {

    let recipe: Recipe

    @EnvironmentObject private var recipeListVM: RecipeListViewModel
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        HStack(spacing: 16) {
            thumbnailView
            recipeInfoView
            Spacer()
            chevronIcon
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
        .shadow(color: shadowColor, radius: 2)
    }

    // MARK: - Subviews

    private var thumbnailView: some View {
        WebImage(url: recipe.photoUrlSmall) { webImage in
            webImage
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
        } placeholder: {
            Image(systemName: "photo.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .cornerRadius(10)
                .foregroundColor(.gray)
        }
    }

    private var recipeInfoView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(recipe.name ?? "Unknown Recipe")
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(1)

            Text(recipe.cuisine ?? "Unknown Cuisine")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(1)
        }
        .padding(.vertical, 8)
    }

    private var chevronIcon: some View {
        Image(systemName: "chevron.right")
            .foregroundColor(.gray)
    }

    private var shadowColor: Color {
        colorScheme == .dark ? Color.white.opacity(0.5) : Color.black.opacity(0.5)
    }
}

struct RecipeListCellView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeListCellView(recipe: mockRecipe)
                .previewDisplayName("Light Mode")
                .preferredColorScheme(.light)

            RecipeListCellView(recipe: mockRecipe)
                .previewDisplayName("Dark Mode")
                .preferredColorScheme(.dark)
        }
    }
}
