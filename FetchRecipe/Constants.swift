//
//  Constants.swift
//  FetchRecipe
//
//  Created by James Layton on 11/7/24.
//

import Foundation

struct K {
    static var isPreviewMode: Bool {
        ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
    
    struct URL {
        static let baseURL = "https://d3jbb8n5wk0qxi.cloudfront.net"
    }
}

enum RecipeEndpoints {
    static func recipe(baseURL: URL) -> URL {
        return baseURL.appendingPathComponent("/recipes.json")
    }

    static func malformedRecipe(baseURL: URL) -> URL {
        return baseURL.appendingPathComponent("/recipes-malformed.json")
    }

    static func emptyRecipe(baseURL: URL) -> URL {
        return baseURL.appendingPathComponent("/recipes-empty.json")
    }
}
