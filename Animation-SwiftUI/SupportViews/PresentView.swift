//
//  PresentView.swift
//  Animation-SwiftUI
//
//  Created by Alex Fila on 29/09/24.
//


//
//  PresentView.swift
//  SwiftUIChristmasTree

import SwiftUI

struct PresentView: View {
    var body: some View {
        Text("💝")
            .phaseAnimator([false, true]) { AirPodsMax, threeDYRotate in
                AirPodsMax
                    .rotation3DEffect(.degrees(threeDYRotate ? 0 : 360 * 5), axis: (x: 0, y: 1, z: 0))
            } animation: { threeDYRotate in
                    .linear(duration: 5).speed(0.3).repeatForever(autoreverses: false)
            }
    }
}

#Preview {
    PresentView()
        .preferredColorScheme(.dark)
}
