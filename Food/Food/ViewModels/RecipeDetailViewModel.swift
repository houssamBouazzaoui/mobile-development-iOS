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
    
    @Published private(set) var state: StateResponse<Recipe> = .notAvailable
    @Published  var hasError: Bool = false
    var recipeId: Int
    
    private let service: RecipeApiService

    init(service: RecipeApiService = RecipeApiServiceImpl(), recipeId: Int){
        self.service = service
        self.recipeId = recipeId
    }
    
    func getRecipeDetails() async {
        self.state = .loading
        self.hasError = false
        do{
            let recipe = try await service.fetchRecipeDetails(by: recipeId)
            self.state = .success(data: recipe)
        }catch{
            self.state = .failed(error: error)
            self.hasError = true
        }
    }
}
