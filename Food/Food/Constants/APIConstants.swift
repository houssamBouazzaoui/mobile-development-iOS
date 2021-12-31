//
//  APIConstants.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 31/12/2021.
//

import Foundation
enum APIConstants{
    
    static let baseUrl = "https://api.spoonacular.com/recipes/complexSearch?apiKey=\(apiKey)&diet=primal&number=1"
    
    private static let apiKey: String = {
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

