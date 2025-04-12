//
//  TodayWeatherView.swift
//  WeatherApp 2025
//
//  Created by Manyuchi, Carrington C on 2025/04/12.
//

import SwiftUI

struct TodayWeatherView: View {
    
    @ObservedObject var cityViewModel: CityViewViewModel = CityViewViewModel()
    var body: some View {
        VStack {
            Text("Today")
                .font(.largeTitle)
                .bold()
            
            HStack {
                LottieView(name: cityViewModel.getLottieAnimationFor(icon: cityViewModel.weatherIcon))
                    .frame(width: 100, height: 100)
                
                VStack(alignment: .leading) {
                    Text("\(cityViewModel.temperature)")
                        .font(.system(size: 42))
                    Text(cityViewModel.conditions)
                }
            }
            
            
                ScrollView(.horizontal) {
                    HStack {
                    Spacer()
                    widgetView(image: "sunrise.fill", color: .green, title: "Sunrise")
                    Spacer()
                    widgetView(image: "sunset.fill", color: .red, title: "Sunset")
                    Spacer()
                    widgetView(image: "moon.fill", color: .blue, title: "Moon")
                    Spacer()
                    widgetView(image: "cloud.fill", color: .gray, title: "Clouds")
                    Spacer()
                }
            }
        }
        .padding()
        .foregroundStyle(.white)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [.blue.opacity(0.5)]
                        ),
                        startPoint: .top,
                        endPoint: .bottom
                    ).opacity(0.6)
                )
        )
        .shadow(color: .black.opacity(0.2), radius: 2, x: 2, y: 2)
        .shadow(color: .black.opacity(0.2), radius: 2, x: -2, y: -2)
    }
    
    private func widgetView(image: String, color: Color, title: String) -> some View {
        VStack {
            Image(systemName: image)
                .padding()
                .font(.title)
                .foregroundColor(color)
                .background(.white)
                .clipShape(.rect(cornerRadius: 10))
            
            Text(title)
            
        }
    }
}

#Preview {
    TodayWeatherView()
}
