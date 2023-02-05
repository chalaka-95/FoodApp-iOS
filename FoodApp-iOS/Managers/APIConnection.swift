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
    static let authLogin = "https://coruscating-smakager-171246.netlify.app/api/user/userdata"
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
    
    
    //Load all food Data
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
    
    //Search Food
    func search(with query: String, completion: @escaping (Result<[FoodResponse], Error>) -> Void) {
        print("This is =\(query)")
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: "\(Constants.baseURL)/api/food/\(query)") else { return }
        print("\(url)")

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do{
                let results = try JSONDecoder().decode(FoodResponse.self, from: data)
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(results)
                completion(.success([results]))
            } catch{
                completion(.failure(APIError.failedTogetData))
            }
        }

        task.resume()
    }
    
//    func search(with query: String, completion: @escaping (Result<[FoodResponse], Error>) -> Void) {
//            guard let url = URL(string: "\(Constants.baseURL)/api/food/\(query)") else {return }
//        print("This is the url \(url)")
//            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
//                guard let data = data, error == nil else {
//                    return
//                }
//
//                do{
//                    let results = try JSONDecoder().decode(FoodResponse.self, from: data)
//                    completion(.success([results]))
//                } catch{
//                    completion(.failure(APIError.failedTogetData))
//                }
//
//            }
//            task.resume()
//        }
    
    func getSelectedFood(with query: String, completion: @escaping (Result<[FoodResponse], Error>) -> Void) {

        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let url = URL(string: "\(Constants.baseURL)/api/food/\(query)") else {return}
        print("This is URL \(url)")
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                let results = try JSONDecoder().decode(FoodResponse.self, from: data)
                print("This is Result \(results)")
                completion(.success([results]))
                

            } catch {
                completion(.failure(error))
                //print(error.localizedDescription)
            }

        }
        task.resume()
    }
    
    //Search Food
    func searchFavFoodsByUserId(with query: String, completion: @escaping (Result<[FoodResponse], Error>) -> Void) {
        print("This is =\(query)")
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: "\(Constants.baseURL)/api/favorite/\(query)") else { return }
        print("\(url)")

        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do{
                let results = try JSONDecoder().decode([FoodResponse].self, from: data)
                //let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(results)
                completion(.success(results))
            } catch{
                completion(.failure(APIError.failedTogetData))
            }
        }

        task.resume()
    }
    
    //Login
    static func userLogin(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void ) {
    
        let url = URL(string: "\(Constants.authLogin)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let parameters = ["email": email, "password": password]
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters)
        
        // Send the request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                do {
                    let statusCode = (response as! HTTPURLResponse).statusCode
                    if statusCode >= 200 && statusCode < 300 {
                        completion(.success(()))
                        print("status Code:\(statusCode)")
                        let UID: String = String(data: data, encoding: .utf8)!
                        let originalString = "\"\(UID)\""
                        let modifiedString = originalString.replacingOccurrences(of: "\"", with: "")
                        UserDefaults.standard.set(modifiedString, forKey: "userId")
                        print(modifiedString)
                    } else {
                        let error = NSError(domain: "API", code: statusCode, userInfo: nil)
                        completion(.failure(error))
                    }
                }
                catch {print("error")}
                return
            }
        }
        task.resume()
    }
    
    
    //Add to favorite list
    static func addToFavorite(userId: String, foodId:String, completion: @escaping (Result<Void, Error>) -> Void) {
        // Build the API request
        let url = URL(string: "\(Constants.baseURL)/api/favorite")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let parameters = ["userId": userId, "foodId": foodId]
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters)
        
        // Send the request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let data = data {
            do {
                // Parse the response
                let statusCode = (response as! HTTPURLResponse).statusCode
                let massage: String = String(data: data, encoding: .utf8)!
                print("Status Code:\(statusCode)")
                if statusCode >= 200 && statusCode < 300 {
                    completion(.success(()))
                } else {
                    let error = NSError(domain: "API", code: statusCode, userInfo: nil)
                    completion(.failure(error))
                }
            }
            catch{print("error")}
            }
        }
        task.resume()
    }
}
