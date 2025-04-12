//
//  HourlyWeatherview.swift
//  WeatherApp 2025
//
//  Created by Manyuchi, Carrington C on 2025/04/12.
//

import SwiftUI

struct HourlyWeatherview: View {
    
    @ObservedObject var cityViewModel: CityViewViewModel = CityViewViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(cityViewModel.weather.hourly) { weather in
                    let icon = cityViewModel.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
                    let hour = cityViewModel.getTimeFor(timestamp: weather.dt)
                    let temp = cityViewModel.getTempFor(temp: weather.temp)
                    
                    getHourlyView(hour: "\(hour)", image: icon, temp: temp)
                }
                
                
            }
        }
    }
    
    private func getHourlyView(hour: String, image: Image, temp: String) -> some View {
        VStack(spacing: 20) {
            Text("\(hour)")
            
            image
                .foregroundStyle(.yellow)
            
            Text(temp)
        }
        .foregroundStyle(.white)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [Color(#colorLiteral(red: 0.5411764706, green: 0.7607843137, blue: 0.9764705882, alpha: 1)) , Color(#colorLiteral(red: 0.4196078431, green: 0.5333333333, blue: 0.937254902, alpha: 1))]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                )
        .shadow(color: .black.opacity(0.2), radius: 2, x: 2, y: 2)
        .shadow(color: .white.opacity(0.2), radius: 2, x: -2, y: -2)
    }
}

#Preview {
    HourlyWeatherview()
}
