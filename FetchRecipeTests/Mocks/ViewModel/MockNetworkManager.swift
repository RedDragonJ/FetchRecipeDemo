//
//  MockNetworkManager.swift
//  FetchRecipe
//
//  Created by James Layton on 11/7/24.
//

import Foundation

enum MockDataType {
    case correctData
    case malformedData
    case emptyData
    case urlError
    case customError
}

class MockNetworkManager: NetworkRepository {
    private let mockDataType: MockDataType

    init(mockDataType: MockDataType) {
        self.mockDataType = mockDataType
    }

    func getRecipes(url: URL) async throws -> RecipesData {
        let data: Data

        switch mockDataType {
        case .correctData:
            data = try JSONSerialization.data(withJSONObject: correctDataDictionary)

        case .malformedData:
            data = try JSONSerialization.data(withJSONObject: malformedDataDictionary)

        case .emptyData:
            data = try JSONSerialization.data(withJSONObject: emptyDataDictionary)
        case .urlError:
            throw URLError(.badURL, userInfo: [NSURLErrorFailingURLErrorKey: url])

        case .customError:
            throw NSError(domain: "com.sample.FetchRecipe", code: 999, userInfo: [NSLocalizedDescriptionKey: "Custom error occurred"])
        }

        // Decode the data into RecipesData model
        do {
            let decodedData = try JSONDecoder().decode(RecipesData.self, from: data)
            return decodedData
        } catch {
            throw error
        }
    }
}
