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
                    switch homeVM.state{
                    case .success(let data):
                        ScrollView{
                            RecipeList(recipes: data)
                                .navigationTitle("Recipes")
                        }
                    case .loading:
                        ProgressView()
                    default:
                        EmptyView()
                    }
            }
            .navigationViewStyle(.stack)
            .task {
                await homeVM.getRandomRecipes()
            }.alert("Error",
                    isPresented: $homeVM.hasError,
                    presenting: homeVM.state){ detail in
                Button("Retry"){
                    Task{
                        await homeVM.getRandomRecipes()
                    }
                }
                Button("Cancel"){
                    
                }
            } message: { detail in
                if case let .failed(error) = detail{
                    Text(error.localizedDescription)
                }
            }
    }
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
