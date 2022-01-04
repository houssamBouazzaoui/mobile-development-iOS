//
//  RecipeList.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 04/01/2022.
//

import SwiftUI

struct RecipeList: View {
    @State private var showRecipeDetailView = false
    var recipes: [Recipe]
    var body: some View {
        VStack{
            HStack{
                Text("\(recipes.count) \(recipes.count > 1 ? "recipes" : "recipe")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                
                    Spacer()
            }
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15){
                ForEach(recipes){ recipe in
                    RecipeCard(recipe:recipe)
                        .onTapGesture {
                            showRecipeDetailView.toggle()
                        }.sheet(isPresented: $showRecipeDetailView){
                            RecipeDetailView(recipeId: recipe.id)
                            
                        }
                    
                }
                
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView{
            RecipeList(recipes: Recipe.all)
        }
    }
}
