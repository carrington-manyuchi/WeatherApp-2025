//
//  CityViewViewModel.swift
//  WeatherApp 2025
//
//  Created by Manyuchi, Carrington C on 2025/04/12.
//

import Foundation
import UIKit
import SwiftUI
import CoreLocation

final class CityViewViewModel: ObservableObject {
    
    @Published  var weather = WeatherResponse.empty()
    @Published var city: String = "Mutare" {
        didSet {
            getLocation() // TODO: - Call to get location - Thus getLocation
        }
    }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    private lazy var dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }()
    
    private lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    init() {
        getLocation()     //TODO: - getLocation
    }
    
    //TODO: Computed Properties - //TODO: - Return a formatted response
    var date: String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.dt)))
    }
    
    var weatherIcon: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "dayRain"
    }
    
    var temperature: String {
        return getTempFor(temp: weather.current.temp)
    }
    
    var conditions: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return ""
    }
    
    var windspeed: String {
        return String(format: "%0.1f", weather.current.wind_speed)
    }
    
    var humidity: String {
        return String(format: "%d%%", weather.current.humidity)
    }
    
    var rainChances: String {
        return String(format: "%0.0f%%", weather.current.dew_point)
    }
    
    func getTimeFor(timestamp: Int) -> String {
        return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    func getTempFor(temp: Double) -> String {
        return String(format: "%.1f°C", temp)
    }
    
    func getDayFor(timestamp: Int) -> String {
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    //TODO: - with guard statement
    private func getLocationTwo() {
        CLGeocoder().geocodeAddressString(city) { [weak self] (placemarks, error) in
            guard let self = self else { return }
            
            if let error = error {
                print("Geocoding failed: \(error.localizedDescription)")
                return
            }
            
            guard let coordinate = placemarks?.first?.location?.coordinate else {
                print("Could not find coordinates for city: \(self.city)")
                return
            }
            
            self.getWeather(coord: coordinate)
        }
    }
    
    //TODO: - with if let statement
    private func getLocation() {
        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
            if let error = error {
                print("Geocoding failed: \(error.localizedDescription)")
                return
            }
            
            if let coordinate = placemarks?.first?.location?.coordinate {
                self.getWeather(coord: coordinate)
            } else {
                print("Could not find coordinates for city: \(self.city)")
            }
        }
    }
    
    private func getWeather(coord: CLLocationCoordinate2D?) {
        if let coord = coord {
            let urlString = API.getURLFor(lat: coord.latitude, lon: coord.longitude)
            getWeatherInternal(city: city, for: urlString)
        } else {
            let urlString = API.getURLFor(lat: 18.9758, lon: 32.6691)
            getWeatherInternal(city: city, for: urlString)
        }
    }
    
    private func  getWeatherInternal(city: String, for urlString: String) {
        NetworkManager<WeatherResponse>.fetch(for: URL(string: urlString)!) { [weak self] result in
            switch result {
            case . success(let response):
                DispatchQueue.main.async {
                    self?.weather = response
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    
    func getLottieAnimationFor(icon: String) -> String {
        switch icon {
        case "01d":
            return "dayClearSky"
        case "01n":
            return "nightClearSky"
            
        case "02d":
            return "dayFewClouds"
        case "02n":
            return "nightFewClouds"
            
        case "03d":
            return "dayScatteredClouds"
        case "03n":
            return "nightScatteredClouds"
            
        case "04d":
            return "dayBrokenClouds"
        case "04n":
            return "nightBrokenClouds"
            
        case "09d":
            return "dayShowerRains"
        case "09n":
            return "nightShowerRains"
            
        case "10d":
            return "dayRain"
        case "10n":
            return "nightRain"
            
        case "11d":
            return "dayThunderstorm"
        case "11n":
            return "nightThunderstom"
            
        case "13d":
            return "daySnow"
        case "13n":
            return "nightSnow"
            
        case "50d":
            return "dayMist"
        case "50n":
            return "dayMist"
            
        default:
            return "dayClearSky"
            
        }
    }
    
    func getWeatherIconFor(icon: String) -> Image {
        switch icon {
        case "01d":
            return Image(systemName: "sun.max.fill") // Clear Sky day
        case "01n":
            return Image(systemName: "moon.fill") // Clear Sky night

        case "02d":
            return Image(systemName: "coud.sun.fill") // few clouds day
        case "02n":
            return Image(systemName: "cloud.moon.fill") // few clouds night

        case "03d":
            return Image(systemName: "cloud.fill") // scattered clouds day
        case "03n":
            return Image(systemName: "cloud.fill") // scattered clouds

        case "04d":
            return Image(systemName: "cloud.fill") // broken clouds day
        case "04n":
            return Image(systemName: "cloud.fill") // broken clouds day night

        case "09d":
            return Image(systemName: "cloud.drizzle.fill") // shower day
        case "09n":
            return Image(systemName: "cloud.drizzle.fill") // shower night

        case "10d":
            return Image(systemName: "cloud.heavyrain.fill") // heavyrain day
        case "10n":
            return Image(systemName: "cloud.heavyrain.fill") // heavyrain night

        case "11d":
            return Image(systemName: "cloud.bolt.fill") // Thunderstormday
        case "11n":
            return Image(systemName: "cloud.bolt.fill") //Thunderstorm night

        case "13d":
            return Image(systemName: "cloud.snow.fill") // snow day
        case "13n":
            return Image(systemName: "cloud.snow.fill") // snow night

        case "50d":
            return Image(systemName: "cloud.fog.fill") // mist  day
        case "50n":
            return Image(systemName: "cloud.fog.fill") // mist night

        default:
            return Image(systemName: "sun.max.fill") // default

        }
    }
    
}
