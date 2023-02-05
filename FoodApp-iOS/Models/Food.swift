//
//  Food.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-01-30.
//

//import Foundation
//
//struct TrendingFoodResponse: Codable {
//    let results:[Food]
//}
//
//struct Food: Codable {
//    let id: String?
//   let foodID: String?
//    let name: String
//    let cuisine: String?
//    let description: String?
//    let calories: String?
//    let carbohydrates: String?
//    let fat: String?
//    let protein: String?
//    let sugar: String?
//    let ingredient: String?
//    let imageURL: String?
//    let isActive: Bool?
//    let createdDateTime: String?
//
//}

import Foundation

struct FoodResponse: Codable {
//    let food:[Foods]
//}
//struct Foods: Codable {
    let id: String?
    let foodId: String?
    let name: String?
    let cuisine: String?
    let description: String?
    let calories: String?
    let carbohydrates: String?
    let fat: String?
    let protein: String?
    let sugar: String?
    let ingredient: String?
    let imageUrl: String?
    let isActive: Bool?
    let createdDateTime: String?
//
    enum CodingKeys: String, CodingKey,Codable {
        case id
        case foodId
        case name
        case cuisine
        case description
        case calories
        case carbohydrates
        case fat
        case protein
        case sugar
        case ingredient
        case imageUrl
        case isActive
        case createdDateTime
   }
}

