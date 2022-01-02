//
//  RecipeViewModel.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 31/12/2021.
//

import Foundation

protocol RecipeViewModel: ObservableObject{
    func getRecipes() async
}

@MainActor
final class RecipeViewModelImpl: RecipeViewModel{
    @Published private(set) var recipes: [Recipe] = []
    var diet: String
    private let repository: RecipeRepository

    init(repository: RecipeRepository = RecipeRepositoryImpl(), diet: String){
        self.repository = repository
        self.diet = diet
    }
    
    func getRecipes() async{
        do{
            self.recipes = try await repository.fetchRecipes(by: diet)
        }catch{
            print(error)
        }
    }
    
}
