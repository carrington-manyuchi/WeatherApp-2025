//
//  MenuHeaderView.swift
//  WeatherApp 2025
//
//  Created by Manyuchi, Carrington C on 2025/04/12.
//

import SwiftUI

struct MenuHeaderView: View {
    
    @ObservedObject var cityViewModel: CityViewViewModel = CityViewViewModel()
    @State private var searchTerm: String = "Mutare"
    
    
    var body: some View {
        HStack {
            TextField("Search city", text: $searchTerm)
                .padding(.leading, 20)
                .foregroundStyle(.secondary)
            
            Button {
                cityViewModel.city = searchTerm
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(.blue)
                    Image(systemName: "location.fill")
                        .foregroundStyle(.white)
                    
                        
                }
            }
            .frame(width: 50, height: 50)
            .padding()
            .background(
                ZStack(alignment: .leading, content: {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.white)
                        .padding(10)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.bar.opacity(0.5))
                        
                })
            )

        }
        //.foregroundStyle(.white)
    }
}

#Preview {
    MenuHeaderView()
}
