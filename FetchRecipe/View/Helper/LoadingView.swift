//
//  LoadingView.swift
//  FetchRecipe
//
//  Created by James Layton on 11/8/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .foregroundStyle(.gray)
    }
}

#Preview {
    LoadingView()
}
