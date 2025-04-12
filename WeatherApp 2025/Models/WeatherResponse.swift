//
//  WeatherResponse.swift
//  WeatherApp 2025
//
//  Created by Manyuchi, Carrington C on 2025/04/12.
//

import Foundation

class WeatherResponse: Codable {
    var current: Weather
    var hourly: [Weather]
    var daily: [DailyWeather]
    
    init(current: Weather, hourly: [Weather], daily: [DailyWeather]) {
        self.current = current
        self.hourly = hourly
        self.daily = daily
    }
    
    static func empty() -> WeatherResponse {
        return WeatherResponse(
            current: Weather(),
            hourly: [Weather](repeating: Weather(), count: 23),
            daily: [DailyWeather](repeating: DailyWeather.placeholder, count: 8)
        )
    }
}

