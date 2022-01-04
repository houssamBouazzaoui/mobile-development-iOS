//
//  CategoriesView.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 03/01/2022.
//

import SwiftUI

struct CategoriesView: View {
    @ObservedObject private var categoryRecipesVM = CategoryRecipesViewModelImpl()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(navCategory.allCases){ category in
                    NavigationLink{
                        ScrollView{
                            RecipeList(recipes:Recipe.all)
                        }
                        .navigationTitle(category.rawValue)
                    } label:{
                        Text(category.rawValue)
                    }
                }
            }
            .navigationTitle("Categories")
        }
        .navigationViewStyle(.stack)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
