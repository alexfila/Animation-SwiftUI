//
//  DraggingAnimation.swift
//  Animation-SwiftUI
//
//  Created by Alex Fila on 23/9/24.
//

import SwiftUI

struct DraggingAnimationView: View {

    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: 12)
    @State private var colors = [Color.gray, Color.blue, Color.green, Color.mint, Color.red, Color.brown, Color.black, Color.yellow]
    @State private var offset = CGSize.zero
    @State private var scalingFactor : CGFloat = 1
    @State private var isOn : Bool = false
    
    let mainAnimation = Animation.spring(response: 0.5, dampingFraction: 0.3, blendDuration: 0.6)
    let numCircles = 252
    let speed : Double = 340
    
    var body: some View {
        VStack {
            VStack{
                Spacer()
                
                LazyVGrid(columns: gridColumns) {
                    ForEach((0..<numCircles).indices, id: \.self) { index in
                        Circle()
                            .foregroundColor(colors.randomElement())
                            .offset(offset)
                            .scaleEffect(scalingFactor)
                            .animation(mainAnimation.delay(Double(index) / speed), value: offset)
                    }
                }
                .gesture(DragGesture()
                            .onChanged({ drag in
                    offset = drag.translation
                    isOn = true
                }))
                
                Spacer()
            }
            .navigationTitle("Dragging Objects")
            .navigationBarTitleDisplayMode(.large)
            .clipShape(Rectangle())
            .safeAreaInset(edge: .top, spacing: 0) {
                Color.clear.frame(height: 0)
            }
            .safeAreaInset(edge: .bottom, spacing: 0) {
                Color.clear.frame(height: 0)
            }
            StartStopButton(animating: $isOn, resetOnly:  true) {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.5, blendDuration: 1).repeatForever()) {
                    reset()
                }
            }
        }
    }
    
    func reset() {
        scalingFactor = 1
        offset = .zero
    }
}
    
#Preview { DraggingAnimationView() }

