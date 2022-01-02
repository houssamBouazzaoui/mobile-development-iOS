//
//  ContentView.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 28/12/2021.
//

import SwiftUI

struct MainView: View {
    var diets = ["primal","vegan","vegetarian","ketogenic","paleo"]
    var body: some View {
        VStack{
            NavigationView{
                VStack{
                    ScrollView{
                        ForEach(diets[0..<diets.count], id:\.self){ diet in
                            NavigationLink(destination: RecipeView(diet: diet)){
                                Text(diet)
                                        .frame(minWidth: 0, maxWidth: 300)
                                        .padding(20)
                                        .foregroundColor(.white)
                                        .background(Color(UIColor(named:diet)!))
                                        .cornerRadius(15)
                                        .font(.title)
                            }
                            .padding()
                        }.navigationTitle(Text("App"))
                    }
                }
            }
        }
            
    }
    private var NavigationViewImageBackground: some View {
            GeometryReader { geometry in
                Image("NavView_background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geometry.size.width)
            }
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
