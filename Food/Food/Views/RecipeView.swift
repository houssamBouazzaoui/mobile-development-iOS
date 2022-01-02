//
//  RecipeView.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 31/12/2021.
//

import SwiftUI

struct RecipeView: View {
    var diet: String
    @State private var showRecipeDetailView = false
    @ObservedObject private var recipeVM = RecipeViewModelImpl(diet: "")
    @State private var recipeId: String = ""
    init(diet:String){
        self.diet = diet
        recipeVM.diet = diet
    }
    
    var body: some View {
        VStack{
            ScrollView{
                ForEach(recipeVM.recipes){recipe in
                    VStack{
                        Spacer()
                        AsyncImage(url: URL(string: recipe.image)){ image in
                            image
                                .resizable()
                                .cornerRadius(30)
                        }placeholder: {
                            Image(systemName: "photo.circle")
                        }
                        Text(recipe.title)
                        HStack{
                            RecipeDetailButtonView()
                                .padding()
                                .onTapGesture {
                                    recipeId = String(recipe.id)
                                    showRecipeDetailView.toggle()
                                }.sheet(isPresented: $showRecipeDetailView){
                                    RecipeDetailView(recipeId: String(recipe.id))
                                }
                            
                        }
                        
                    }
                    .padding(.all, 20.0)
                    .padding(.vertical, 30)
                    .frame(height: 350)
                    .background(.ultraThinMaterial, in:
                                    RoundedRectangle(cornerRadius: 30,
                                                     style:.continuous))
                    .shadow(color:Color("Shadow").opacity(0.3), radius:10, x:0,y:10)
                    .padding(.horizontal, 30)
                }
            }
            .task { await recipeVM.getRecipes()}
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(diet: "primal")
    }
}
