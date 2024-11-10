//
//  RecipeDetailTitleView.swift
//  FetchRecipe
//
//  Created by James Layton on 11/8/24.
//

import SwiftUI

struct RecipeDetailTitleView: View {
    
    let name: String?
    let cuisine: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let name = name {
                Text(name)
                    .font(.title)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top, 8)
            }
            
            if let cuisine = cuisine {
                Text(cuisine)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
            }
        }
    }
}

struct RecipeDetailTitleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeDetailTitleView(name: "Fried Rice", cuisine: "Asian")            .environmentObject(MockRecipeListViewModel(mockDataType: .correctData))
                .previewDisplayName("Light Mode")
                .preferredColorScheme(.light)
            
            RecipeDetailTitleView(name: "Fried Rice", cuisine: "Asian")            .environmentObject(MockRecipeListViewModel(mockDataType: .correctData))
                .previewDisplayName("Dark Mode")
                .preferredColorScheme(.dark)
        }
    }
}
