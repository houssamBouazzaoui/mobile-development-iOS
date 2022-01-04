//
//  SwiftUIView.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 02/01/2022.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipeId: Int
    @ObservedObject private var recipeDetailVM = RecipeDetailViewModelImpl(recipeId: 0)
    
    init(recipeId: Int){
        self.recipeId = recipeId
        recipeDetailVM.recipeId = recipeId
    }
    
    var body: some View {
        ScrollView{
            AsyncImage(url: URL(string: recipeDetailVM.recipe.image)){ image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    
            }placeholder:{
                Image(systemName:"photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center )
                    .foregroundColor(.white).opacity(0.7)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
            }
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(
                        colors:[Color(.gray).opacity(0.3),Color(.gray)]),
                        startPoint: .top, endPoint: .bottom))
            
            VStack(spacing: 30){
                Text(recipeDetailVM.recipe.title)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading, spacing: 20){
                    if !recipeDetailVM.recipe.summary.isEmpty{
                        Text(recipeDetailVM.recipe.summary)
                    }
                    if !recipeDetailVM.recipe.summary.isEmpty{                    VStack(alignment: .leading, spacing: 20){
                            Text("Ingredients")
                                .font(.headline)
                            Text("Hier komen de ingrediënten")
                        }
                    }
                    if !recipeDetailVM.recipe.summary.isEmpty  {                  VStack(alignment: .leading, spacing: 20){
                            Text("Directions")
                                .font(.headline)
                            Text("Hoe moet je dit maken")
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea(.container, edges: .top)
        .task {
            await recipeDetailVM.getRecipeDetails()
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipeId: 0)
    }
}