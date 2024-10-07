//
//  ContentView.swift
//  TraficLight
//
//  Created by Максим Назаров on 06.10.2024.
//

import SwiftUI

enum CurrentLight {
    case red
    case yellow
    case green
}

struct ContentView: View {
    
    @State private var redAlpha = 0.3
    @State private var yellowAlpha = 0.3
    @State private var greenAlpha = 0.3
    @State private var currentLight = CurrentLight.red
    @State private var buttonTitle = "START"
    
    private let lightIsOff = 0.3
    private let lightIsOn = 1.0
    
    var body: some View {
        VStack {
            CircleView(color: .red, alpha: redAlpha)
            CircleView(color: .yellow, alpha: yellowAlpha)
            CircleView(color: .green, alpha: greenAlpha)
            Spacer()
        }
        .padding()
        Button(action: switchLight) {
            Text(buttonTitle)
                .foregroundStyle(.white)
                .font(.largeTitle)
                .bold()
        }
        .frame(width: 250, height: 70)
        .background(.cyan)
        .clipShape(Capsule())
        .overlay(Capsule().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
        .padding(.bottom, 16)
    }
    
    private func switchLight() {
        if buttonTitle == "START" {
            buttonTitle = "NEXT"
        }
        
        switch currentLight {
        case .red:
            greenAlpha = lightIsOff
            redAlpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redAlpha = lightIsOff
            yellowAlpha = lightIsOn
            currentLight = .green
        case .green:
            yellowAlpha = lightIsOff
            greenAlpha = lightIsOn
            currentLight = .red
        }
    }
    
}

#Preview {
    ContentView()
}
