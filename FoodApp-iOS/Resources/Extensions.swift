//
//  Extensions.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-01-28.
//

import Foundation
extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
