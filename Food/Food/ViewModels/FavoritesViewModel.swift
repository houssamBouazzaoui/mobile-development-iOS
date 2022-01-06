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
    @Published var recipes:[Recipe] = []
    
    var recipeIds: [String]
    private let repository: RecipeRepository
    
    init(repository: RecipeRepository = RecipeRepositoryImpl(),recipeIds:[String]){
        self.repository = repository
        self.recipeIds = recipeIds
    }
    
    func getFavoriteRecipes() async{
        do{
            self.recipes = try await repository.fetchFavoriteRecipes(recipeIds: recipeIds)
        }catch{
            print(error)
        }
    }
}
