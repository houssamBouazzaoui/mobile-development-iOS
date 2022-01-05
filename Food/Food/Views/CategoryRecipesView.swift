//
//  CategoryRecipesView.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 05/01/2022.
//

import SwiftUI

struct CategoryRecipesView: View {
    var category:navCategory
    
    @ObservedObject private var categoryRecipeVM = CategoryRecipesViewModelImpl()
    
    var body: some View {
        ScrollView{
            RecipeList(recipes: categoryRecipeVM.recipes)
        }.task{
            await categoryRecipeVM.getRecipesByDiet(by: category.rawValue)
        }
    }
}

struct CategoryRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRecipesView(category:navCategory.primal)
    }
}
