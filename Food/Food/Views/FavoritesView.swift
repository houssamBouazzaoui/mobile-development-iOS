//
//  FavoritesView.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 03/01/2022.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        NavigationView{
            Text("Favorites")
                .navigationTitle("Favorites")
        }
        .navigationViewStyle(.stack)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
