//
//  CategoryRecipesView.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 05/01/2022.
//

import SwiftUI

struct CategoryRecipesView: View {
    var category:navCategory
    
    @ObservedObject private var categoryRecipeVM = CategoryRecipesViewModelImpl()
    
    var body: some View {
        ZStack{
            switch categoryRecipeVM.state{
            case .success(let recipes):
                ScrollView{
                    RecipeList(recipes: recipes)
                }
            case .loading:
                ProgressView()
            default:
                EmptyView()
            }
        }
        .task{
            await categoryRecipeVM.getRecipesByDiet(by: category.rawValue)
        }.alert("Error",
                isPresented: $categoryRecipeVM.hasError,
                presenting: categoryRecipeVM.state){ detail in
            Button("Retry"){
                Task{
                    await categoryRecipeVM.getRecipesByDiet(by: category.rawValue)
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

struct CategoryRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRecipesView(category:navCategory.primal)
    }
}
