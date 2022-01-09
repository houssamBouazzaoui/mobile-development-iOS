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
    
    enum State{
        case notAvailable
        case loading
        case success(data:[Recipe])
        case failed(error:Error)
    }
    @Published private(set) var state: State = .notAvailable
    @Published  var hasError: Bool = false
    private let service: RecipeApiService

    init(service: RecipeApiService = RecipeApiServiceImpl()){
        self.service = service
    }

    func getRandomRecipes() async {
        self.state = .loading
        self.hasError = false
        do{
            let recipes = try await service.fetchRandomRecipes()
            self.state = .success(data: recipes)
        }catch{
            self.state = .failed(error: error)
            self.hasError = true
        }
    }
}
