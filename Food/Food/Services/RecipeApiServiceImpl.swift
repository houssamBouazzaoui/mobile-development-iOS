//
//  RecipeApiServiceImpl.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 31/12/2021.
//

import Foundation

protocol RecipeApiService{
    func fetchRecipes(by diet: String) async throws -> [Recipe]
    func fetchRecipeDetails(by id:String) async throws -> Recipe
}

final class RecipeApiServiceImpl: RecipeApiService{
    
    func fetchRecipes(by diet: String) async throws -> [Recipe] {
        let urlSession = URLSession.shared
        
        var url = URL(string:"")
        
        switch diet{
            case "primal": url = URL(string: APIConstants.primal)
            case "vegan": url = URL(string: APIConstants.vegan)
            case "vegetarian": url = URL(string: APIConstants.vegetarien)
            case "ketogenic": url = URL(string: APIConstants.ketogenic)
            case "paleo": url = URL(string: APIConstants.paleo)
            default: print("diet \(diet) bestaat niet")
        }
        
        
        let (data, _) = try await urlSession.data(from: url!)
        let decodedData = try JSONDecoder().decode(RecipeServiceResult.self, from: data)
        return decodedData.results
    }
    
    func fetchRecipeDetails(by id: String) async throws -> Recipe {
        let urlSession = URLSession.shared
        let url = URL(string: APIConstants.baseUrl.appending("\(id)/information?includeNutrition=false"))
        let (data, _) = try await urlSession.data(from:url!)
        let decodeData = try JSONDecoder().decode(Recipe.self, from: data)
        return decodeData
    }
}
