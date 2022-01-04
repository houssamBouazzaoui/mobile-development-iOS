//
//  HomeViewModel.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 03/01/2022.
//

import Foundation
import SwiftUI
protocol HomeViewModel: ObservableObject{
    func getRandomRecipes() async
}

@MainActor
final class HomeViewModelImpl: HomeViewModel{
    @Published private(set) var recipes: [Recipe] = []
    
    private let repository: RecipeRepository

    init(repository: RecipeRepository = RecipeRepositoryImpl()){
        self.repository = repository
    }

    func getRandomRecipes() async {
        do{
            self.recipes = try await repository.fetchRandomRecipes()
        }catch{
            print(error)
        }
    }
}
