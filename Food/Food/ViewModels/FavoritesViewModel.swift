//
//  FavoritesViewModel.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 06/01/2022.
//

import Foundation
import SwiftUI
protocol FavoritesViewModel: ObservableObject{
    func getFavoriteRecipes() async
}

@MainActor
final class FavoritesViewModelImpl: FavoritesViewModel{
    
    @Published private(set) var state: StateResponse<[Recipe]> = .notAvailable
    @Published  var hasError: Bool = false

    var recipeIds: [String]
    private let service: RecipeApiService
    
    init(service: RecipeApiService = RecipeApiServiceImpl(),recipeIds:[String]){
        self.service = service
        self.recipeIds = recipeIds
    }
    
    func getFavoriteRecipes() async{
        self.state = .loading
        self.hasError = false
        do{
            let recipes = try await service.fetchFavoriteRecipes(recipeIds: recipeIds)
            self.state = .success(data: recipes)
        }catch{
            self.state = .failed(error: error)
            self.hasError = true
        }
    }
}
