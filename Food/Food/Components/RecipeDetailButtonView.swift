//
//  RecipeDetailButtonView.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 02/01/2022.
//

import SwiftUI

struct RecipeDetailButtonView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 50)
                .foregroundColor(Color("RecipeDetail"))
            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
        .frame(height: 50)
        .cornerRadius(15)
    }
}

struct RecipeDetailButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailButtonView()
    }
}
