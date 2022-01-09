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
        
        if(!favorites.getRecipesIds().isEmpty){
            NavigationView{
                switch favoritesVM.state{
                    case .success(let recipes):
                        ScrollView{
                            RecipeList(recipes: recipes)
                                .navigationTitle("Recipes")
                        }
                        .navigationTitle("Favorites")
                    case .loading:
                        ProgressView()
                    default:
                        EmptyView()
                }
            }
            .navigationViewStyle(.stack)
            .environmentObject(favorites)
            .task {
                await favoritesVM.getFavoriteRecipes()
            }.alert("Error",
                    isPresented: $favoritesVM.hasError,
                    presenting: favoritesVM.state){ detail in
                Button("Retry"){
                    Task{
                        await favoritesVM.getFavoriteRecipes()
                    }
                }
                Button("Cancel"){
                    
                }
            } message: { detail in
                if case let .failed(error) = detail{
                    Text(error.localizedDescription)
                }
            }
        }else{
            Text("You have no favorite recipes")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
