//
//  RecipeServiceResult.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 31/12/2021.
//

import Foundation

struct RecipeServiceResult: Codable{
    let results: [Recipe]
}

struct Recipe: Codable, Identifiable {
    let id: Int
    var title: String
}
