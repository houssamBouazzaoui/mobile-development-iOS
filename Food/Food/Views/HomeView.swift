//
//  ContentView.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 28/12/2021.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var homeVM = HomeViewModelImpl()
    var body: some View {
            NavigationView{
                ScrollView{
                    //RecipeList(recipes: homeVM.recipes)
                }
                .navigationTitle("Recipes")
                .task {
                    //await homeVM.getRandomRecipes()
                }
                
            }
            .navigationViewStyle(.stack)
        
    }
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
