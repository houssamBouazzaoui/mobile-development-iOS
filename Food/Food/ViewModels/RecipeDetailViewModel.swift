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

final class RecipeDetailViewModelImpl: RecipeDetailViewModel{
    
    @Published private(set) var recipe: Recipe = Recipe(id: 0, title: "", image: "")
    
    var recipeId: String
    
    private let repository: RecipeRepository

    init(repository: RecipeRepository = RecipeRepositoryImpl(), recipeId: String){
        self.repository = repository
        self.recipeId = recipeId
    }
    
    func getRecipeDetails() async {
        do{
            self.recipe = try await repository.fetchRecipeDetails(by: recipeId)
        }catch{
            print(error)
        }
    }
    
    
}
