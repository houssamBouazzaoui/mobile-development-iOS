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
    @EnvironmentObject var favorites: Favorites
    init(recipeId: Int){
        self.recipeId = recipeId
        recipeDetailVM.recipeId = recipeId
    }
    
    var body: some View {
       NavigationView{
            switch recipeDetailVM.state{
                case .success(let recipe):
                    details(recipe: recipe)
                case .loading:
                    ProgressView()
                default:
                    EmptyView()
                }
        }
       .navigationViewStyle(.stack)
        .task {
            await recipeDetailVM.getRecipeDetails()
        }.alert("Error",
                isPresented: $recipeDetailVM.hasError,
                presenting: recipeDetailVM.state){ detail in
            Button("Retry"){
                Task{
                    await recipeDetailVM.getRecipeDetails()
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
    
    private func details(recipe: Recipe) -> some View {
        ScrollView{
            detailsImage(recipe: recipe)
            detailsBody(recipe: recipe)
        }
        .ignoresSafeArea(.container, edges: .top)
        .navigationBarHidden(true)
        
    }
    
   private func detailsImage(recipe: Recipe) -> some View{
       AsyncImage(url: URL(string: recipe.image)){ image in
           image
               .resizable()
               .aspectRatio(contentMode: .fill)
               .overlay(alignment: .bottom){
                   Image(systemName: favorites.contains(recipeId) ? "heart.fill" : "heart")
                       .font(.system(size:30))
                       .foregroundColor(.red)
                       .shadow(color: .black, radius: 3, x: 0, y: 0)
                       .frame(maxWidth: UIScreen.screenWidth,alignment: .bottomTrailing)
                       .padding()
                       .onTapGesture{
                           if self.favorites.contains(recipeId) {
                               self.favorites.remove(recipeId)
                           } else {
                               self.favorites.add(recipeId)
                           }
                       }
               }
       }placeholder:{
           Image(systemName:"photo")
               .resizable()
               .scaledToFit()
               .frame(width: 100, height: 100, alignment: .center )
               .foregroundColor(.white).opacity(0.7)
               .frame(maxWidth: .infinity, maxHeight: .infinity)
               .overlay(alignment: .bottom){
                   Image(systemName: favorites.contains(recipeId) ? "heart.fill" : "heart")
                       .font(.system(size: 30))
                       .foregroundColor(.red)
                       .shadow(color: .black, radius: 3, x: 0, y: 0)
                       .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                       .padding()
                       .onTapGesture{
                           if self.favorites.contains(recipeId) {
                                     self.favorites.remove(recipeId)
                                 } else {
                                     self.favorites.add(recipeId)
                                 }
                       }
               }
       }
       .frame(height: 300)
       .background(LinearGradient(gradient: Gradient(
                   colors:[Color(.gray).opacity(0.3),Color(.gray)]),
                   startPoint: .top, endPoint: .bottom))
          }
    
    private func detailsBody(recipe: Recipe) -> some View{
        VStack(spacing: 30){
            Text(recipe.title)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            
            VStack(alignment: .leading, spacing: 30){
                if !recipe.summary.isEmpty{
                    Text(recipe.summary)
                }
                if !recipe.extendedIngredients.isEmpty{
                    VStack(alignment: .leading, spacing: 10){
                        Text("Ingredients")
                            .font(.headline)
                        ForEach(recipe.extendedIngredients){ ingredient in
                            Text("- "+ingredient.nameClean)
                        }
                    }
                }
                if !recipe.analyzedInstructions.isEmpty  {
                    VStack(alignment: .leading, spacing: 20){
                        Text("Directions")
                            .font(.headline)
                        ForEach(0..<recipe.analyzedInstructions.count, id: \.self){ instruction in
                            ForEach(0..<recipe.analyzedInstructions[instruction].steps.count, id: \.self){ step in
                                Text("Step "+String(recipe.analyzedInstructions[instruction].steps[step].number))
                                    .font(.headline)
                                Text(recipe.analyzedInstructions[instruction].steps[step].step)
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal,40)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipeId:716426)
    }
}
