//
//  SwiftUIView.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 02/01/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipeId: String
    @ObservedObject private var recipeDetailVM = RecipeDetailViewModelImpl(recipeId:"")
    init(recipeId:String){
        self.recipeId = recipeId
        Print("DSFDF _> ", recipeId)
        recipeDetailVM.recipeId = recipeId
    }
    var body: some View {
        Text(recipeDetailVM.recipe.title)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipeId: "")
    }
}
