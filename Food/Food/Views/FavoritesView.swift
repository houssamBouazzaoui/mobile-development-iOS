//
//  FavoritesView.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 03/01/2022.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var favorites = Favorites()
    @ObservedObject private var favoritesVM = FavoritesViewModelImpl(recipeIds:[])
    
    init(){
        favoritesVM.recipeIds = favorites.getRecipesIds()
    }
    
    var body: some View {
        NavigationView{
            ScrollView{
                if !favoritesVM.recipes.isEmpty {
                    RecipeList(recipes: favoritesVM.recipes)
                }else{
                    Text("You have no favorite recipes")
                        .padding()
                }
            }
            .navigationTitle("Favorites")
            .task {
                await favoritesVM.getFavoriteRecipes()
            }
        }
        .navigationViewStyle(.stack)
        .environmentObject(favorites)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
