//
//  NetworkManager.swift
//  FetchRecipe
//
//  Created by James Layton on 11/7/24.
//

import Foundation

class NetworkManager: NetworkRepository {
    private let urlSession: URLSession
    private let decoder: JSONDecoder

    // Default session configuration to ephemeral so nothing is cached or persisted
    init(urlSession: URLSession = URLSession(configuration: .ephemeral),
         decoder: JSONDecoder = JSONDecoder()) {
        self.urlSession = urlSession
        self.decoder = decoder
    }

    func getRecipes(url: URL) async throws -> RecipesData {

        let (data, response) = try await urlSession.data(from: url)

        // Check response
        guard let httpURLResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        guard httpURLResponse.statusCode == 200 else {
            throw URLError(URLError.Code(rawValue: httpURLResponse.statusCode))
        }

        // Decode data
        do {
            return try decoder.decode(RecipesData.self, from: data)
        } catch {
            throw URLError(.cannotDecodeContentData)
        }
    }
}
