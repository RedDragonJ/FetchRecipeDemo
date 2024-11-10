//
//  MockRecipeListViewModel.swift
//  FetchRecipe
//
//  Created by James Layton on 11/7/24.
//

import Foundation

class MockRecipeListViewModel: RecipeListViewModel {
    init(mockDataType: MockDataType) {
        let mockNetworkManager = MockNetworkManager(mockDataType: mockDataType)
        super.init(networkManager: mockNetworkManager)
    }

    @MainActor
    override func fetchRecipes() async {
        await super.fetchRecipes()
    }
}
