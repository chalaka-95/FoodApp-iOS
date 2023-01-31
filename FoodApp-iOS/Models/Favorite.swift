//
//  Favorite.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-01-31.
//

import Foundation

struct FavoriteFoodResponse: Codable {
    let results:[FavoriteFood]
}
struct FavoriteFood: Codable {
    let id, foodID, name, cuisine: String?
    let description, ingredient: String?
    let imageURL: String?
    let isActive: Bool?
}
