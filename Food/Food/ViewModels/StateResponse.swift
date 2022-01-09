//
//  StateResponse.swift
//  Food
//
//  Created by Houssam Bouazzaoui on 09/01/2022.
//

import Foundation
enum StateResponse<T>{
    case notAvailable
    case loading
    case success(data:T)
    case failed(error:Error)
}
