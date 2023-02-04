//
//  Favorite.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-01-31.
//

import Foundation

struct FavoriteFoodResponse: Codable {
    let id: String?
    let foodID: String?
    let imageURL: String?
    
    enum CodingKeys: String, CodingKey, Codable {
        case id
        case foodID
        case imageURL
    }
}


