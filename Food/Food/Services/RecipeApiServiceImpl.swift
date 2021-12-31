//
//  RecipeApiService.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 31/12/2021.
//

import Foundation

protocol RecipeApiService{
    func fetchRecipes() async throws -> [Recipe]
}

final class RecipeApiServiceImpl: RecipeApiService{
    
    func fetchRecipes() async throws -> [Recipe] {
        let urlSession = URLSession.shared
        let url = URL(string: APIConstants.baseUrl)
        let (data, _) = try await urlSession.data(from: url!)
        let decodedData = try JSONDecoder().decode(RecipeServiceResult.self, from: data)
        return decodedData.results
    }
    
}
