//
//  WaveDots.swift
//  Animation-SwiftUI
//
//  Created by Alex Fila on 23/9/24.
//

import SwiftUI

struct WaveDotsView: View {
    static var columns = 8
    @State private var isAnimating = false
    @State private var gridColumns = Array(repeating: GridItem(.flexible(maximum: 30)), count: WaveDotsView.columns)
    @State private var colors: [Color] = [.green, .teal, .blue, .black, .mint, .orange, .yellow, .pink]
    @State private var scaleFactor : CGFloat = 2.5
    let springAnimation = Animation.spring(response: 0.5, dampingFraction: 0.65, blendDuration: 0.8)
    let numCircles = 70

    var body: some View {
        VStack {
            Text("The wave will start on tap, click on stop to reset")
                .padding(.vertical, 25)
            Spacer()
            LazyVGrid(columns: gridColumns) {
                ForEach(0..<numCircles, id: \.self) { index in
                    Circle()
                        .foregroundColor(colors[index % colors.count])
                        .scaleEffect(scaleFactor)
                        .animation(springAnimation.delay((Double(index).truncatingRemainder(dividingBy: 10) / 20)).repeatCount(2, autoreverses: true), value: scaleFactor)
                        .onTapGesture {
                            isAnimating = true
                            scaleFactor = ((Double(index).truncatingRemainder(dividingBy: Double(numCircles/WaveDotsView.columns)) + 1) / 4)
                        }
                }
            }
            Spacer()
            StartStopButton(animating: $isAnimating, resetOnly: true) {
                scaleFactor = 2.5
            }
        }
        .navigationTitle("Wave Dots")
        .navigationBarTitleDisplayMode(.large)
        
    }
}

struct WaveDotsView_Previews: PreviewProvider {
    static var previews: some View {
        WaveDotsView()
    }
}
