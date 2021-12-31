//
//  RecipeViewModel.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 31/12/2021.
//

import Foundation

protocol RecipeViewModel: ObservableObject{
 func getRecipesDietPrimal() async
}

@MainActor
final class RecipeViewModelImpl: RecipeViewModel{
    @Published private(set) var recipes: [Recipe] = []
    
    //private let apiService: RecipeApiService
    private let repository: RecipeRepository
    init(repository: RecipeRepository){
        self.repository = repository
    }
    
    func getRecipesDietPrimal() async{
        do{
            self.recipes = try await repository.fetchRecipes()
        }catch{
            print(error)
        }
    }
}
