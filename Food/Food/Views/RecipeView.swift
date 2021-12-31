//
//  RecipeView.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 31/12/2021.
//

import SwiftUI

struct RecipeView: View {
    @StateObject private var recipeVM = RecipeViewModelImpl(
        repository: RecipeRepositoryImpl()
    )
    
    var body: some View {
        List{
            ForEach(recipeVM.recipes){recipe in
                VStack{
                    Text(recipe.title)
                }
            }
        }
        .task {
            await recipeVM.getRecipesDietPrimal()
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
