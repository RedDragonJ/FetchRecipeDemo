//
//  Recipe.swift
//  FetchRecipe
//
//  Created by James Layton on 11/7/24.
//

import Foundation

struct RecipesData: Codable {
    let recipes: [Recipe]
}

struct Recipe: Codable, Identifiable {
    let id: String
    let cuisine: String
    let name: String
    let photoUrlLarge: URL?
    let photoUrlSmall: URL?
    let sourceUrl: URL?
    let youtubeUrl: URL?

    private var _youtubeThumbnailUrl: URL?
    var youtubeThumbnailUrl: URL? {
        get {
            if let _youtubeThumbnailUrl = _youtubeThumbnailUrl {
                return _youtubeThumbnailUrl
            }
            // Generate the URL if not manually set
            guard let youtubeUrl = youtubeUrl,
                  let videoID = youtubeUrl.query?.components(separatedBy: "v=").last else {
                return nil
            }
            return URL(string: "https://img.youtube.com/vi/\(videoID)/hqdefault.jpg")
        }
        set {
            _youtubeThumbnailUrl = newValue
        }
    }

    init(
        id: String = UUID().uuidString,
        cuisine: String,
        name: String,
        photoUrlLarge: URL? = nil,
        photoUrlSmall: URL? = nil,
        sourceUrl: URL? = nil,
        youtubeUrl: URL? = nil,
        youtubeThumbnailUrl: URL? = nil
    ) {
        self.id = id
        self.cuisine = cuisine
        self.name = name
        self.photoUrlLarge = photoUrlLarge
        self.photoUrlSmall = photoUrlSmall
        self.sourceUrl = sourceUrl
        self.youtubeUrl = youtubeUrl
        self.youtubeThumbnailUrl = youtubeThumbnailUrl
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? UUID().uuidString
        cuisine = try container.decode(String.self, forKey: .cuisine)
        name = try container.decode(String.self, forKey: .name)
        photoUrlLarge = try container.decodeIfPresent(URL.self, forKey: .photoUrlLarge)
        photoUrlSmall = try container.decodeIfPresent(URL.self, forKey: .photoUrlSmall)
        sourceUrl = try container.decodeIfPresent(URL.self, forKey: .sourceUrl)
        youtubeUrl = try container.decodeIfPresent(URL.self, forKey: .youtubeUrl)
    }

    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case cuisine
        case name
        case photoUrlLarge = "photo_url_large"
        case photoUrlSmall = "photo_url_small"
        case sourceUrl = "source_url"
        case youtubeUrl = "youtube_url"
    }
}
