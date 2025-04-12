//
//  Weather.swift
//  WeatherApp 2025
//
//  Created by Manyuchi, Carrington C on 2025/04/12.
//

import Foundation

class Weather: Codable, Identifiable {
    var dt: Int
    var temp: Double
    var feel_like: Double
    var pressure: Int
    var humidity: Int
    var dew_point: Double
    var clouds: Int
    var wind_speed: Double
    var wind_deg: Int
    var weather: [WeatherDetail]
    
    init(
            dt: Int = 0,
            temp: Double = 0.0,
            feel_like: Double = 0.0,
            pressure: Int = 0,
            humidity: Int = 0,
            dew_point: Double = 0.0,
            clouds: Int = 0,
            wind_speed: Double = 0.0,
            wind_deg: Int = 0,
            weather: [WeatherDetail] = [WeatherDetail(main: "", description: "", icon: "")]
        ) {
            self.dt = dt
            self.temp = temp
            self.feel_like = feel_like
            self.pressure = pressure
            self.humidity = humidity
            self.dew_point = dew_point
            self.clouds = clouds
            self.wind_speed = wind_speed
            self.wind_deg = wind_deg
            self.weather = weather
        }
}

extension Weather {
    var id: UUID {
        return UUID()
    }
}

