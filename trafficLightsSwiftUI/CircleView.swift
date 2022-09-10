//
//  circleView.swift
//  trafficLightsSwiftUI
//
//  Created by ikorobov on 09.09.2022.
//

import SwiftUI

struct CircleView: View {
    var body: some View {
        Circle()
            .frame(width: 100, height: 100)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
}

struct circleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
