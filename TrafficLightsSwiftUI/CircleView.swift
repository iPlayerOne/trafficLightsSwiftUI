//
//  circleView.swift
//  trafficLightsSwiftUI
//
//  Created by ikorobov on 09.09.2022.
//

import SwiftUI

struct CircleView: View {
    
    let color: Color
    let opacity: Double
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: 100, height: 100)
            .opacity(opacity)
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4)
            )
    }
    
    init(color: Color, opacity: Double) {
        self.color = color
        self.opacity = opacity
    }
}

struct circleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(color: .blue, opacity: 0.9)
    }
}
