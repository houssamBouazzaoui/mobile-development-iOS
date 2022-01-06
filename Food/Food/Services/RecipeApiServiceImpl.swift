//
//  RecipeApiServiceImpl.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 31/12/2021.
//

import Foundation
import SwiftUI

protocol RecipeApiService{
    func fetchRecipes(by diet: String) async throws -> [Recipe]
    func fetchRecipeDetails(by id: Int) async throws -> Recipe
    func fetchRandomRecipes() async throws -> [Recipe]
    func fetchFavoriteRecipes(recipeIds:[String]) async throws -> [Recipe]
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
    
    func fetchRecipeDetails(by id: Int) async throws -> Recipe {
        let urlSession = URLSession.shared
        let url = URL(string:APIConstants.baseUrl.appending("\(id)/information?apiKey=\(APIConstants.apiKey)&includeNutrition=false"))
        let (data,_) = try await urlSession.data(from:url!)
        let decodeData = try JSONDecoder().decode(Recipe.self, from: data)
        return decodeData
    }
    
    func fetchRandomRecipes() async throws -> [Recipe]{
        let urlSession = URLSession.shared
        let url = URL(string:APIConstants.random)
        let (data,_) = try await urlSession.data(from:url!)
        let decodeData = try JSONDecoder().decode(RecipeServiceRandomResult.self, from: data)
        return decodeData.recipes
    }
    
    func fetchFavoriteRecipes(recipeIds:[String]) async throws -> [Recipe]{
        let urlSession = URLSession.shared
        var apiUrl: String = ""
        recipeIds.forEach{ id in
            apiUrl.append("\(id),")
        }
        let url = URL(string: APIConstants.favorites.appending("\(apiUrl)"))
        let (data,_) = try await urlSession.data(from:url!)
        let decodeData = try JSONDecoder().decode([Recipe].self, from: data)
        return decodeData
    }
    
}
