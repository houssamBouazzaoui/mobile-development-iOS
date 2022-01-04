//
//  RecipeViewModel.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 31/12/2021.
//

import Foundation

protocol CategoryRecipesViewModel: ObservableObject{
    func getRecipesByDiet(by diet: String) async
}

@MainActor
final class CategoryRecipesViewModelImpl: CategoryRecipesViewModel{
    @Published private(set) var recipes: [Recipe] = []
    private let repository: RecipeRepository

    init(repository: RecipeRepository = RecipeRepositoryImpl()){
        self.repository = repository
    }
    
    func getRecipesByDiet(by diet: String) async{
        do{
            self.recipes = try await repository.fetchRecipes(by: diet)
        }catch{
            print(error)
        }
    }
}
