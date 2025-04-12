//
//  CItyNameView.swift
//  WeatherApp 2025
//
//  Created by Manyuchi, Carrington C on 2025/04/12.
//

import SwiftUI

struct CityNameView: View {
    
    var city: String
    var date: String
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 10) {
                Text(city)
                    .font(.title)
                    .fontWeight(.bold)
                Text(date)
                    .font(.caption)
            }
        }
    }
}

#Preview {
    CityNameView(city: "Mutare", date: "12 December 2025")
}
