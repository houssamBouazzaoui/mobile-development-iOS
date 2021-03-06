//
//  TabBar.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 03/01/2022.
//

import SwiftUI

struct TabBar: View {
    @ObservedObject var favorites = Favorites()
        var body: some View {
        TabView{
            HomeView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }

            CategoriesView()
                .tabItem{
                    Label("Categories", systemImage: "square.fill.text.grid.1x2")
                }
            
            FavoritesView()
                .tabItem{
                    Label("Favorites", systemImage: "heart")
                }
        }.environmentObject(favorites)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
