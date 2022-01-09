//
//  APIConstants.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 31/12/2021.
//

import Foundation
import SwiftUI
enum APIConstants{
    static let baseUrl="https://api.spoonacular.com/recipes/"
    static let primal = "\(baseUrl)complexSearch?apiKey=\(apiKey)&fillIngredients=true&addRecipeInformation=true&diet=primal&number=\(amountofRecipes)"
    static let vegan = "\(baseUrl)complexSearch?apiKey=\(apiKey)&fillIngredients=true&addRecipeInformation=true&diet=vegan&number=\(amountofRecipes)"
    static let vegetarien = "\(baseUrl)complexSearch?apiKey=\(apiKey)&fillIngredients=true&addRecipeInformation=true&diet=vegetarian&number=\(amountofRecipes)"
    static let paleo = "\(baseUrl)complexSearch?apiKey=\(apiKey)&fillIngredients=true&addRecipeInformation=true&diet=paleo&number=\(amountofRecipes)"
    static let ketogenic = "\(baseUrl)complexSearch?apiKey=\(apiKey)&fillIngredients=true&addRecipeInformation=true&diet=keotgenic&number=\(amountofRecipes)"
    static let random = "\(baseUrl)random?apiKey=\(apiKey)&number=10"
    static var favorites = "\(baseUrl)informationBulk?apiKey=\(apiKey)&ids="
    private static let amountofRecipes: Int = 10
    
    static let apiKey: String = {
            guard let filePath = Bundle.main.path(forResource: "spoonacular-Info", ofType: "plist")else{
                fatalError("Couldn't find file 'spoonacular-Info.plist'.")
            }
            
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "API_KEY") as? String else{
                fatalError("Couldn't find 'API_KEY' in 'spoonacular-Info.plist'.")
            }
            
            return value
    }()
}


