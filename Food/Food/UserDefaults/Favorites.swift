//
//  Favorites.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 06/01/2022.
//

import SwiftUI

class Favorites: ObservableObject {
    private var recipes: Set<String>
    let defaults = UserDefaults.standard
    
    init() {
        let decoder = JSONDecoder()
        if let data = defaults.data(forKey: "Favorites") {
            let recipeData = try? decoder.decode(Set<String>.self, from: data)
            self.recipes = recipeData ?? []
        } else {
            self.recipes = []
        }
    }
    
    func getRecipesIds() -> [String] {
        return Array(self.recipes)
    }
    
    func isEmpty() -> Bool {
        recipes.count < 1
    }
    
    func contains(_ recipeId: Int) -> Bool {
        recipes.contains(String(recipeId))
    }
    
    func add(_ recipeId: Int) {
        objectWillChange.send()
        recipes.insert(String(recipeId))
        save()
    }
    
    func remove(_ recipeId: Int) {
        objectWillChange.send()
        recipes.remove(String(recipeId))
        save()
    }
    
    func save() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(recipes) {
            defaults.set(encoded, forKey: "Favorites")
        }
    }
}
