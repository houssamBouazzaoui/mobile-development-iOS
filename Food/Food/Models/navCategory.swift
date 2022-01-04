//
//  navCategory.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 04/01/2022.
//

import Foundation

enum navCategory: String, CaseIterable, Identifiable{
    var id: String { self.rawValue }
    case primal = "primal"
    /*case vegan = "vegan"
    case vegetarian = "vegetarian"
    case ketogenic = "ketogenic"
    case paleo = "paleo"*/
}
