//
//  RecipeRepository.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 31/12/2021.
//

import Foundation

protocol RecipeRepository{
    func fetchRecipes() async throws -> [Recipe]
}

final class RecipeRepositoryImpl: RecipeRepository{
    private let apiService: RecipeApiService
    
    init(apiService: RecipeApiService = RecipeApiServiceImpl()){
        self.apiService = apiService
    }
    
    func fetchRecipes() async throws -> [Recipe]{
        var recipes: [Recipe] = []
        do{
            recipes = try await apiService.fetchRecipes()
        }catch{
            print(error)
        }
        return recipes
    }
}
