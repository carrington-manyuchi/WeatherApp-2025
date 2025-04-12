//
//  DailyWeather.swift
//  WeatherApp 2025
//
//  Created by Manyuchi, Carrington C on 2025/04/12.
//

import Foundation

struct DailyWeather: Codable, Identifiable {
    var dt: Int
    var temp: Temperature
    var weather: [WeatherDetail]
    
    init(dt: Int, temp: Temperature, weather: [WeatherDetail]) {
        self.dt = dt
        self.temp = temp
        self.weather = weather
    }
    
    static let placeholder  =  DailyWeather(
        dt:  0,
        temp: Temperature(min:0.0, max: 0.0),
        weather: [WeatherDetail(main: "", description: "", icon: "")]
    )
}


extension DailyWeather {
    var id: UUID {
        return UUID()
    }
}
