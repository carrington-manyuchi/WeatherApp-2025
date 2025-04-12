//
//  ContentView.swift
//  WeatherApp 2025
//
//  Created by Manyuchi, Carrington C on 2025/04/12.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var cityViewModel = CityViewViewModel()
    
    var body: some View {
        ZStackLayout(alignment: .bottom) {
            
            VStack(spacing: 0) {
                MenuHeaderView(cityViewModel: cityViewModel)
                ScrollView {
                    CityView(cityViewModel: cityViewModel)
                }
            }
            .padding(.top, 30)
            
        }
        .padding(.bottom)
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
