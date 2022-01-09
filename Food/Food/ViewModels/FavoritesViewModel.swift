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
    private let service: RecipeApiService
    
    init(service: RecipeApiService = RecipeApiServiceImpl(),recipeIds:[String]){
        self.service = service
        self.recipeIds = recipeIds
    }
    
    func getFavoriteRecipes() async{
        do{
            self.recipes = try await service.fetchFavoriteRecipes(recipeIds: recipeIds)
        }catch{
            print(error)
        }
    }
}
