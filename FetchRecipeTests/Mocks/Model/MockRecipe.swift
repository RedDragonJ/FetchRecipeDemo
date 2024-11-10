//
//  MockRecipe.swift
//  FetchRecipe
//
//  Created by James Layton on 11/7/24.
//

import Foundation

let correctDataDictionary: [String: Any] = [
    "recipes": [
        [
            "uuid": "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
            "cuisine": "Malaysian",
            "name": "Apam Balik",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
            "source_url": "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
            "youtube_url": "https://www.youtube.com/watch?v=6R8ffRRJcrg",
            "youtube_thumbnail_url": "https://img.youtube.com/vi/6R8ffRRJcrg/hqdefault.jpg"
        ],
        [
            "uuid": "599344f4-3c5c-4cca-b914-2210e3b3312f",
            "cuisine": "British",
            "name": "Apple & Blackberry Crumble",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg",
            "source_url": "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble",
            "youtube_url": "https://www.youtube.com/watch?v=4vhcOwVBDO4",
            "youtube_thumbnail_url": "https://img.youtube.com/vi/4vhcOwVBDO4/hqdefault.jpg"
        ]
    ]
]

let malformedDataDictionary: [String: Any] = [
    "recipes": [
        [
            "uuid": "599344f4-3c5c-4cca-b914-2210e3b3312f",
            "cuisine": "British",
            // "name" field is missing
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg",
            "source_url": "https://example.invalidurl",
            "youtube_url": "https://www.youtube.com/watch?v=4vhcOwVBDO4"
        ],
        [
            "uuid": "74f6d4eb-da50-4901-94d1-deae2d8af1d1",
            // "cuisine" field is missing
            "name": "Apple Frangipan Tart",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/7276e9f9-02a2-47a0-8d70-d91bdb149e9e/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/7276e9f9-02a2-47a0-8d70-d91bdb149e9e/small.jpg",
            "source_url": "https://example.com",
            "youtube_url": "https://www.youtube.com/watch?v=rp8Slv4INLk"
        ],
        [
            "uuid": "39ad8233-c470-4394-b65f-2a6c3218b935",
            "cuisine": "Canadian",
            "name": "Canadian Butter Tarts",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/f18384e7-3da7-4714-8f09-bbfa0d2c8913/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/f18384e7-3da7-4714-8f09-bbfa0d2c8913/small.jpg",
            "source_url": "https://www.bbcgoodfood.com/recipes/1837/canadian-butter-tarts"
            // "youtube_url" field is missing
        ],
        [
            "uuid": "265454f1-d1a6-470c-bc20-1d9ba73c8073",
            "cuisine": "British",
            "name": "Eccles Cakes",
            "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/a6c39bad-bc6a-41c6-8588-2c97327a46cd/large.jpg",
            "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/a6c39bad-bc6a-41c6-8588-2c97327a46cd/small.jpg",
            // "source_url" field is missing
            "youtube_url": "https://www.youtube.com/watch?v=xV0QCJ0GD5w"
        ]
    ]
]

// Empty data case
let emptyDataDictionary: [String: Any] = [
    "recipes": []
]
