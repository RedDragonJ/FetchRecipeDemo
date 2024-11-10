//
//  RecipeListViewModel.swift
//  FetchRecipe
//
//  Created by James Layton on 11/7/24.
//

import Foundation

@MainActor
class RecipeListViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var viewState: ViewState = .loading

    private let networkManager: NetworkRepository

    init(networkManager: NetworkRepository = NetworkManager()) {
        self.networkManager = networkManager
    }

    func fetchRecipes() async {
        viewState = .loading

        // Validate URL
        guard let baseURL = URL(string: K.URL.baseURL) else {
            fatalError(AppError.urlError.localizedDescription) // NOTE: Developer error
        }

        do {
            // NOTE: Change different data set to test UI
            let newRecipes = try await networkManager.getRecipes(url: RecipeEndpoints.recipe(baseURL: baseURL))
            recipes = newRecipes.recipes
            viewState = .success

        } catch let error as URLError {
            // Analytics: log the real error
            print(error.localizedDescription)
            // User friendly error message
            errorHandler(error: AppError.networkError)

        } catch let error as DecodingError {
            // Analytics: log the real error
            print(error.localizedDescription)
            // User friendly error message
            errorHandler(error: AppError.decodingError)

        } catch {
            // Analytics: log the real error
            print(error.localizedDescription)
            // User friendly error message
            errorHandler(error: AppError.customError("An unexpected error occurred"))
        }
    }

    private func errorHandler(error: AppError) {
        viewState = .error(error.errorDescription ?? "Unknown error")
    }

    func sortRecipes(ascending: Bool) {
        recipes.sort { ascending ? $0.name < $1.name : $0.name > $1.name }
    }
}
