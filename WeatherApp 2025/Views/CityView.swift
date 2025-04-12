//
//  CityView.swift
//  WeatherApp 2025
//
//  Created by Manyuchi, Carrington C on 2025/04/12.
//

import SwiftUI

struct CityView: View {
    
    
    
    @ObservedObject var cityViewModel: CityViewViewModel = CityViewViewModel()
    
    var body: some View {
        VStack {
            CityNameView(city: cityViewModel.city, date: cityViewModel.date)
                .shadow(radius: 0)
            TodayWeatherView(cityViewModel: cityViewModel)
            
            HourlyWeatherview(cityViewModel: cityViewModel)
                .padding(.bottom,10)
            
            DailyWeatherView(cityViewModel: cityViewModel)
            
        }
        .padding(.bottom, 30)
    }
}

#Preview {
    CityView()
}
