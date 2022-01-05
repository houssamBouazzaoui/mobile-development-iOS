//
//  RecipeRepository.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 31/12/2021.
//

import Foundation

protocol RecipeRepository{
    func fetchRecipes(by diet: String) async throws -> [Recipe]
    func fetchRecipeDetails(by id: Int) async throws -> Recipe
    func fetchRandomRecipes() async throws -> [Recipe]
}

final class RecipeRepositoryImpl: RecipeRepository{
    private let apiService: RecipeApiService
    
    init(apiService: RecipeApiService = RecipeApiServiceImpl()){
        self.apiService = apiService
    }
    
    func fetchRecipes(by diet: String) async throws -> [Recipe]{
        var recipes: [Recipe] = []
        do{
            recipes = try await apiService.fetchRecipes(by: diet)
        }catch{
            print(error)
        }
        return recipes
    }
    
    func fetchRecipeDetails(by id: Int) async throws -> Recipe {
        var recipe: Recipe = Recipe(id:id, title:"", image:"", summary:"",extendedIngredients: [], analyzedInstructions: [])
        do{
            recipe = try await apiService.fetchRecipeDetails(by: id)
        }catch{
            print(error)
        }
        return recipe
    }
    func fetchRandomRecipes() async throws -> [Recipe] {
        var recipes: [Recipe] = []
        do{
            recipes = try await apiService.fetchRandomRecipes()
        }catch{
            print(error)
        }
        return recipes
    }
}
