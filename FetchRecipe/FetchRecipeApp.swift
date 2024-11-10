//
//  FetchRecipeApp.swift
//  FetchRecipe
//
//  Created by James Layton on 11/7/24.
//

import SwiftUI
import SDWebImage

@main
struct FetchRecipeApp: App {
    @StateObject private var recipeListVM = RecipeListViewModel()

    init() {
        setupSDWebImageConfiguration()
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RecipeListView()
                    .environmentObject(recipeListVM)
            }
        }
    }

    private func setupSDWebImageConfiguration() {
        let cacheConfig = SDImageCache.shared.config
        cacheConfig.shouldCacheImagesInMemory = false  // Disable memory cache
        cacheConfig.shouldUseWeakMemoryCache = false   // No weak memory caching
        cacheConfig.diskCacheReadingOptions = .mappedIfSafe  // Optimize disk reading (optional)
    }
}
