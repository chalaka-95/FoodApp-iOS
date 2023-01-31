//
//  APIConnection.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-01-27.
//

import Foundation

struct Constants{
    static let baseURL = "https://coruscating-smakager-171246.netlify.app"
}

enum APIError: Error {
    case failedTogetData
}

class APIConnection {
    static let shared = APIConnection()
    
    func getTrendingFood(completion: @escaping (Result<[TrendingFoodResponse], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/api/food") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do{
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                let results = try JSONDecoder().decode([TrendingFoodResponse].self, from: data)
                //print(results)
                completion(.success(results))
            } catch{
                //print(error.localizedDescription)
                print(error)
                completion(.failure(APIError.failedTogetData))
                
            }
        }
        
        task.resume()
    }
    
    
    
    func getFavoritFood(completion: @escaping (String) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/api/favorite/63c4096c8dafc5f956bf1e92") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do{
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                let results = try JSONDecoder().decode(FavoriteFood.self, from: data)
                print(results)
            } catch{
                //print(error.localizedDescription)
                print(error)
                //completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
    }
}
