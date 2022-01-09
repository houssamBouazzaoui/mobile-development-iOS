//
//  Recipe.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 31/12/2021.
//

import Foundation

struct RecipeServiceResult: Codable{
    let results: [Recipe]
}

struct RecipeServiceRandomResult: Codable{
    let recipes: [Recipe]
}

struct Recipe: Codable, Identifiable {
    let id: Int
    let title: String
    let image: String
    let summary: String
    let extendedIngredients: [Ingredient]
    let analyzedInstructions: [Instructions]
}

struct Ingredient: Codable, Identifiable{
    let id: Int
    let name: String
    let nameClean: String?
    let amount: Double
    let unit: String
}

struct Instructions: Codable{
    let steps: [Steps]
}

struct Steps: Codable{
    let number: Int
    let step: String
}

//Allen gebruikt voor previews
extension Recipe {
    static let all: [Recipe] = [
    Recipe(
        id: 0,
        title: "YUMYUM",
        image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/98892/Creamy-Carrot-Soup-for-Wordpress-360x270-c.jpg",
        summary: "Cauliflower, Brown Rice, and Vegetable Fried Rice might be a good recipe to expand your side dish recipe box. Watching your figure? This gluten free, dairy free, lacto ovo vegetarian, and vegan recipe has <b>192 calories</b>, <b>7g of protein</b>, and <b>6g of fat</b> per serving. For <b>$1.12 per serving</b>, this recipe <b>covers 19%</b> of your daily requirements of vitamins and minerals. This recipe serves 8. This recipe from fullbellysisters.blogspot.com has 3689 fans. This recipe is typical of Chinese cuisine. From preparation to the plate, this recipe takes about <b>30 minutes</b>. Head to the store and pick up peas, broccoli, salt, and a few other things to make it today. Overall, this recipe earns an <b>awesome spoonacular score of 100%</b>. Users who liked this recipe also liked <a href=\"https://spoonacular.com/recipes/vegetable-fried-brown-rice-36199\">Vegetable Fried Brown Rice</a>, <a href=\"https://spoonacular.com/recipes/vegetable-fried-cauliflower-rice-933261\">Vegetable Fried Cauliflower Rice</a>, and <a href=\"https://spoonacular.com/recipes/easy-vegetable-fried-brown-rice-with-egg-802042\">Easy Vegetable Fried Brown Rice with Egg</a>.",
      
        extendedIngredients: [],
        analyzedInstructions: []
    ),
    Recipe(
        id: 1,
        title: "YokiYoki",
        image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/98341/Kale-Apple-Quinoa-Salad-wordpress-360x270-c.jpg",
        summary: "",
       
        extendedIngredients: [],
        analyzedInstructions: []
    ),Recipe(
        id: 2,
        title: "YUMYUM",
        image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/98892/Creamy-Carrot-Soup-for-Wordpress-360x270-c.jpg",
        summary: "",
        
        extendedIngredients: [],
        analyzedInstructions: []
    ),
    Recipe(
        id: 3,
        title: "YokiYoki",
        image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/98341/Kale-Apple-Quinoa-Salad-wordpress-360x270-c.jpg",
        summary: "",
       
        extendedIngredients: [],
        analyzedInstructions: []
    ),Recipe(
        id: 4,
        title: "YUMYUM",
        image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/98892/Creamy-Carrot-Soup-for-Wordpress-360x270-c.jpg",
        summary: "",
       
        extendedIngredients: [],
        analyzedInstructions: []
    ),
    Recipe(
        id: 5,
        title: "YokiYoki",
        image: "https://www.forksoverknives.com/wp-content/uploads/fly-images/98341/Kale-Apple-Quinoa-Salad-wordpress-360x270-c.jpg",
        summary: "",
        
        extendedIngredients: [],
        analyzedInstructions: []
    )
    ]
}
