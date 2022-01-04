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
    
    private let repository: RecipeRepository

    init(repository: RecipeRepository = RecipeRepositoryImpl(), recipeId: Int){
        self.repository = repository
        self.recipeId = recipeId
        self.recipe = Recipe(id:recipeId,title: "", image: "", summary:"")
    }
    
    func getRecipeDetails() async {
        do{
            self.recipe = try await repository.fetchRecipeDetails(by: recipeId)
        }catch{
            print(error)
        }
    }
    
    
}
