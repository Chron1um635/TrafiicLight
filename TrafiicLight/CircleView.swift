//
//  CircleView.swift
//  TraficLight
//
//  Created by Максим Назаров on 06.10.2024.
//

import SwiftUI

struct CircleView: View {
    let color: Color
    let alpha: Double
    
    var body: some View {
        Circle()
            .frame(width: 150, height: 150)
            .foregroundStyle(color)
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .shadow(radius: 10)
            .opacity(alpha)
    }
}

#Preview {
    CircleView(color: .red, alpha: 0.3)
}
