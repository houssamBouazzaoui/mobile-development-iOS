//
//  Utility.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 02/01/2022.
//

import Foundation
import SwiftUI

extension View{
    func Print(_ vars: Any...) -> some View {
            for v in vars { print(v) }
            return EmptyView()
        }
}
