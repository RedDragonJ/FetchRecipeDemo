//
//  RecipeListViewModelTests.swift
//  FetchRecipeTests
//
//  Created by James Layton on 11/10/24.
//

import XCTest

final class RecipeListViewModelTests: XCTestCase {

    var viewModel: RecipeListViewModel!

    override func tearDownWithError() throws {
        viewModel = nil
    }

    @MainActor
    func createViewModel(with mockDataType: MockDataType) {
        let mockNetworkManager = MockNetworkManager(mockDataType: mockDataType)
        viewModel = RecipeListViewModel(networkManager: mockNetworkManager)
    }

    // MARK: - Test fetchRecipes Function

    @MainActor
    func testFetchRecipesSuccess() async {
        // Given
        createViewModel(with: .correctData)

        // When
        await viewModel.fetchRecipes()

        // Then
        XCTAssertEqual(viewModel.recipes.count, 2, "The count of recipes should match mock data.")
        XCTAssertEqual(viewModel.viewState, .success, "The viewState should be .success on successful fetch.")
    }

    @MainActor
    func testFetchRecipesEmptyData() async {
        // Given
        createViewModel(with: .emptyData)

        // When
        await viewModel.fetchRecipes()

        // Then
        XCTAssertEqual(viewModel.recipes.count, 0, "The count of recipes should be 0 for empty data.")
        XCTAssertEqual(viewModel.viewState, .success, "The viewState should be .success even when data is empty.")
    }

    @MainActor
    func testFetchRecipesMalformedDataSucess() async {
        // Given
        createViewModel(with: .malformedData)

        // When
        await viewModel.fetchRecipes()

        // Then
        XCTAssertEqual(viewModel.viewState, .error(AppError.decodingError.localizedDescription), "The viewState should be .success on malformed fetch.")
    }

    // MARK: - Test Sorting Function

    @MainActor
    func testSortRecipesAscending() {
        // Given
        createViewModel(with: .correctData)
        viewModel.recipes = [
            Recipe(id: "1", cuisine: "Dessert", name: "Banana Bread"),
            Recipe(id: "2", cuisine: "Dessert", name: "Apple Pie"),
            Recipe(id: "3", cuisine: "Dessert", name: "Carrot Cake")
        ]

        // When
        viewModel.sortRecipes(ascending: true)

        // Then
        XCTAssertEqual(viewModel.recipes.map { $0.name }, ["Apple Pie", "Banana Bread", "Carrot Cake"], "Recipes should be sorted in ascending order by name.")
    }

    @MainActor
    func testSortRecipesDescending() {
        // Given
        createViewModel(with: .correctData)
        viewModel.recipes = [
            Recipe(id: "1", cuisine: "Dessert", name: "Banana Bread"),
            Recipe(id: "2", cuisine: "Dessert", name: "Apple Pie"),
            Recipe(id: "3", cuisine: "Dessert", name: "Carrot Cake")
        ]

        // When
        viewModel.sortRecipes(ascending: false)

        // Then
        XCTAssertEqual(viewModel.recipes.map { $0.name }, ["Carrot Cake", "Banana Bread", "Apple Pie"], "Recipes should be sorted in descending order by name.")
    }

//    // MARK: - Testing Errors

    @MainActor
    func testFetchRecipes_URLError() async {
        // Given
        createViewModel(with: .urlError)

        // When
        await viewModel.fetchRecipes()

        // Then
        XCTAssertEqual(viewModel.viewState, .error(AppError.networkError.localizedDescription))
        XCTAssertTrue(viewModel.recipes.isEmpty)
    }

    @MainActor
    func testFetchRecipes_CustomError() async {
        // Given
        createViewModel(with: .customError)

        // When
        await viewModel.fetchRecipes()

        // Then
        XCTAssertEqual(viewModel.viewState, .error("An unexpected error occurred"))
        XCTAssertTrue(viewModel.recipes.isEmpty)
    }
}
