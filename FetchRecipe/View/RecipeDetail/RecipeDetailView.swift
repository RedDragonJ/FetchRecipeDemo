import SwiftUI
import SDWebImageSwiftUI

struct RecipeDetailView: View {

    let recipe: Recipe

    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Hero area
                RecipeDetailHeroView(
                    youtubeUrl: recipe.youtubeUrl,
                    photoUrlLarge: recipe.photoUrlLarge,
                    thumbnailUrl: recipe.youtubeThumbnailUrl
                )

                // Recipe Name and Cuisine
                RecipeDetailTitleView(name: recipe.name, cuisine: recipe.cuisine)

                // Source URL Link
                RecipeDetailSourceLinkView(sourceUrl: recipe.sourceUrl)
            }
            .padding(.horizontal)
        }
        .navigationTitle("Recipe Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationStack {
                RecipeDetailView(recipe: mockRecipe)
                    .previewDisplayName("Light Mode")
                    .preferredColorScheme(.light)
            }

            NavigationStack {
                RecipeDetailView(recipe: mockRecipe)
                    .previewDisplayName("Dark Mode")
                    .preferredColorScheme(.dark)
            }
        }
    }
}
