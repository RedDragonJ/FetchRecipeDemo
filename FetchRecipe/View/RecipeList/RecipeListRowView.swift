//
//  RecipeListRow.swift
//  FetchRecipe
//
//  Created by James Layton on 11/8/24.
//

import SwiftUI

struct RecipeListRowView: View {
    let recipe: Recipe
    let onRecipeTapped: () -> Void

    var body: some View {
        ZStack {
            RecipeListCellView(recipe: recipe)
            NavigationLink(destination: RecipeDetailView(recipe: recipe)
                .onAppear(perform: onRecipeTapped)) {
                EmptyView()
            }
            .opacity(0)
        }
        .buttonStyle(PlainButtonStyle())
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
    }
}

struct RecipeListRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeListRowView(recipe: mockRecipe) {}
                .previewDisplayName("Light Mode")
                .preferredColorScheme(.light)

            RecipeListRowView(recipe: mockRecipe) {}
                .previewDisplayName("Dark Mode")
                .preferredColorScheme(.dark)
        }
    }
}
