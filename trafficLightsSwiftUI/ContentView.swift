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
    
    private let isOn = 1.0
    private let isOff = 0.3
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.ignoresSafeArea()
            VStack(spacing: 15) {
                CircleView().foregroundColor(.red.opacity(redLight))
                CircleView().foregroundColor(.yellow.opacity(yellowLight))
                CircleView().foregroundColor(.green.opacity(greenLight))
                Spacer()
                Button(action: { switchLight() }) {
                    Text(title)
                        .font(.title)
                }
                .frame(width: 200, height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 4))
                
            }
            .padding()
        }
        
    }
    
    private func switchLight () {
        title = "NEXT"
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
            ContentView()
        }
        
    }
}

extension ContentView {
    enum CurrentLight {
        case red, yellow, green
    }
}
