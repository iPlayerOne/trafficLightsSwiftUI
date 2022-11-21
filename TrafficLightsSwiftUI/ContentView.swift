//
//  ContentView.swift
//  trafficLightsSwiftUI
//
//  Created by ikorobov on 08.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redLight = 0.3
    @State private var yellowLight = 0.3
    @State private var greenLight = 0.3
    @State private var title = "START"
    
    @State private var currentLight = CurrentLight.red
        
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.ignoresSafeArea()
            VStack(spacing: 15) {
                CircleView(color: .red, opacity: redLight)
                CircleView(color: .yellow, opacity: yellowLight)
                CircleView(color: .green, opacity: greenLight)
                Spacer()
                Button(action: { switchLight() }) {
                    Text(title)
                        .font(.title)
                        .foregroundColor(.white)
                }
                .frame(width: 200, height: 50)
                .background(.blue)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.white, lineWidth: 4))
                
            }
            .padding()
        }
        
    }
    
    private func switchLight () {
        let isOn = 1.0
        let isOff = 0.3
        if title == "START" {
            title = "NEXT"
        }
        switch currentLight {
            case .red:
                greenLight = isOff
                redLight = isOn
                currentLight = .yellow
            case .yellow:
                redLight = isOff
                yellowLight = isOn
                currentLight = .green
            case .green:
                yellowLight = isOff
                greenLight = isOn
                currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
        
    }
}

extension ContentView {
    enum CurrentLight {
        case red, yellow, green
    }
}
