//
//  API.swift
//  WeatherApp 2025
//
//  Created by Manyuchi, Carrington C on 2025/04/12.
//

import Foundation

struct API {
    static let key = "f8c200300740e9affe7daea59ed32b71"
}

extension API {
    static let baseURLString = "https://api.openweathermap.org/data/2.5/forecast"
    
    static func getURLFor(lat: Double, lon: Double) -> String {
        return "\(baseURLString)?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(key)&units=metric"
    }
}
