//
//  RecipeDetailViewModel.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 02/01/2022.
//

import Foundation

protocol RecipeDetailViewModel: ObservableObject{
    func getRecipeDetails() async
}

@MainActor
final class RecipeDetailViewModelImpl: RecipeDetailViewModel{
    
    @Published private(set) var recipe: Recipe
    
    var recipeId: Int
    
    private let service: RecipeApiService

    init(service: RecipeApiService = RecipeApiServiceImpl(), recipeId: Int){
        self.service = service
        self.recipeId = recipeId
        self.recipe = Recipe(id:recipeId,title: "", image: "", summary:"", extendedIngredients: [], analyzedInstructions: [])
    }
    
    func getRecipeDetails() async {
        do{
            self.recipe = try await service.fetchRecipeDetails(by: recipeId)
        }catch{
            print(error)
        }
    }
}
