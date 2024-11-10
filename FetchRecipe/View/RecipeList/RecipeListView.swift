//
//  RecipeListView.swift
//  FetchRecipe
//
//  Created by James Layton on 11/8/24.
//

import SwiftUI

struct RecipeListView: View {

    @EnvironmentObject private var recipeListVM: RecipeListViewModel
    @State private var isSortedAscending = true
    @State private var lastViewedRecipeID: String?

    var body: some View {
        VStack {
            content
        }
        .navigationTitle("Recipes")
        .toolbar {
            sortButton
        }
        .task {
            await recipeListVM.fetchRecipes()
        }
    }

    @ViewBuilder
    private var content: some View {
        switch recipeListVM.viewState {
        case .loading:
            LoadingView()
        case .success:
            if recipeListVM.recipes.isEmpty {
                EmptyStateView(message: "No Recipes") {
                    Task { await recipeListVM.fetchRecipes() }
                }
            } else {
                ScrollViewReader { scrollView in
                    List {
                        ForEach(recipeListVM.recipes, id: \.id) { recipe in
                            RecipeListRowView(recipe: recipe) {
                                lastViewedRecipeID = recipe.id
                            }
                        }
                    }
                    .listStyle(.plain)
                    .refreshable {
                        Task { await recipeListVM.fetchRecipes() }
                    }
                    .onAppear {
                        if let lastViewedRecipeID = lastViewedRecipeID {
                            scrollView.scrollTo(lastViewedRecipeID, anchor: .center)
                        }
                    }
                }
            }
        case .error(let errorMessage):
            ErrorView(errorMessage: errorMessage) {
                Task { await recipeListVM.fetchRecipes() }
            }
        }
    }

    private var sortButton: some View {
        Button(action: {
            isSortedAscending.toggle()
            recipeListVM.sortRecipes(ascending: isSortedAscending)
        }) {
            Image(systemName: "arrow.up.arrow.down")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeListView()
                .environmentObject(MockRecipeListViewModel(mockDataType: .correctData))
                .previewDisplayName("Light Mode")
                .preferredColorScheme(.light)

            RecipeListView()
                .environmentObject(MockRecipeListViewModel(mockDataType: .correctData))
                .previewDisplayName("Dark Mode")
                .preferredColorScheme(.dark)
        }
    }
}
