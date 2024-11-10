//
//  NetworkRepository.swift
//  FetchRecipe
//
//  Created by James Layton on 11/7/24.
//

import Foundation

protocol NetworkRepository {
    func getRecipes(url: URL) async throws -> RecipesData
}
