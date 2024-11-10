//
//  ViewState.swift
//  FetchRecipe
//
//  Created by James Layton on 11/7/24.
//

import Foundation

enum ViewState: Equatable {
    case loading
    case success
    case error(String)
}
