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
    
    @Published private(set) var state: StateResponse<[Recipe]> = .notAvailable
    @Published  var hasError: Bool = false

    private let service: RecipeApiService
  
    
    init(service: RecipeApiService = RecipeApiServiceImpl()){
        self.service = service
    }
    
    func getRecipesByDiet(by diet: String) async{
        self.state = .loading
        self.hasError = false
        do{
            let recipes = try await service.fetchRecipes(by: diet)
            self.state = .success(data: recipes)
        }catch{
            self.state = .failed(error: error)
            self.hasError = true
        }
    }
}
