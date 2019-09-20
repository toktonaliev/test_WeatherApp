//
//  APIService.swift
//  test_WeatherApp
//
//  Created by Nurlan Almazov on 9/20/19.
//  Copyright © 2019 Nurlan Toktonaliev. All rights reserved.
//

import Foundation

class APIService {
    
    static let instance = APIService()
    
    private init() { }
    
    private let baseUrl = "https://api.openweathermap.org/data/2.5/"
    private let apiKey = "8ddb498cf53a6d300f8f4474edab279e"
    
    func getWeatherForCity(city: String, unit: String, completion: @escaping (Weather?) -> Void) {
        
        guard let url = URL(string: "\(baseUrl)weather?q=\(city)&appid=\(apiKey)&units=\(unit)") else {
            print("invalid url string")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { completion(nil); return }
            do {
                let weather = try JSONDecoder().decode(Weather.self, from: data)
                DispatchQueue.main.async {
                    completion(weather)
                }
            } catch let error {
                print("Failed to decode JSON:", error)
                completion(nil)
            }
        }.resume()
    }
}
