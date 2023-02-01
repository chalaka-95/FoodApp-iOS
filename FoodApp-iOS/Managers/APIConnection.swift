//
//  APIConnection.swift
//  FoodApp-iOS
//
//  Created by Chalaka Hasantha on 2023-01-27.
//

import Foundation

struct Constants{
    static let baseURL = "https://coruscating-smakager-171246.netlify.app"
    static let foodTypeByCuisine = "/api/food/cuisine"
}

enum APIError: Error {
    case failedTogetData
}

class APIConnection {
    static let shared = APIConnection()
    
    //Get Indian Foods Data
    func getIndianFood(completion: @escaping (Result<[FoodResponse], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)\(Constants.foodTypeByCuisine)/Indian") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode([FoodResponse].self, from: data)
                completion(.success(results))
            } catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    
    
    //Get Chinese Foods Data
    func getChineseFood(completion: @escaping (Result<[FoodResponse], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)\(Constants.foodTypeByCuisine)/Chinese") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode([FoodResponse].self, from: data)
                completion(.success(results))
            } catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    //Get Italian Foods Data
    func getItalianFood(completion: @escaping (Result<[FoodResponse], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)\(Constants.foodTypeByCuisine)/Italian") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode([FoodResponse].self, from: data)
                completion(.success(results))
            } catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
    }
    
    //Get Thai Foods Data
    func getThaiFood(completion: @escaping (Result<[FoodResponse], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)\(Constants.foodTypeByCuisine)/Thai") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode([FoodResponse].self, from: data)
                completion(.success(results))
            } catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
    }
    
    //Get Japanese Foods Data
    func getJapaneseFood(completion: @escaping (Result<[FoodResponse], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)\(Constants.foodTypeByCuisine)/Japanese") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode([FoodResponse].self, from: data)
                completion(.success(results))
            } catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
    }
    
    //Get American Foods Data
    func getAmericanFood(completion: @escaping (Result<[FoodResponse], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)\(Constants.foodTypeByCuisine)/American") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode([FoodResponse].self, from: data)
                completion(.success(results))
            } catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        
        task.resume()
    }
    
    
    //Get Search Data
    func getSearchFood(completion: @escaping (Result<[FoodResponse], Error>) -> Void) {
            guard let url = URL(string: "\(Constants.baseURL)/api/food") else {return }
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                do{
                    let results = try JSONDecoder().decode([FoodResponse].self, from: data)
                    completion(.success(results))
                } catch{
                    completion(.failure(APIError.failedTogetData))
                }

            }
            task.resume()
        }
    
}
