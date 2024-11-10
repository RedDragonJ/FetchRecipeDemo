//
//  RecipeDetailSourceLinkView.swift
//  FetchRecipe
//
//  Created by James Layton on 11/8/24.
//

import SwiftUI

struct RecipeDetailSourceLinkView: View {
    
    let sourceUrl: URL?

    var body: some View {
        if let sourceUrl = sourceUrl {
            Link(destination: sourceUrl) {
                HStack {
                    Image(systemName: "link")
                    Text("View Full Recipe")
                }
                .font(.headline)
                .foregroundColor(.blue)
                .padding(.horizontal)
                .padding(.top, 8)
            }
        }
    }
}

struct RecipeDetailSourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeDetailSourceLinkView(sourceUrl: mockRecipe.sourceUrl)
                .previewDisplayName("Light Mode")
                .preferredColorScheme(.light)

            RecipeDetailSourceLinkView(sourceUrl: mockRecipe.sourceUrl)
                .previewDisplayName("Dark Mode")
                .preferredColorScheme(.dark)
        }
    }
}
