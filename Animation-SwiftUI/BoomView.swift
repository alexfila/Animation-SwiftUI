//
//  BoomView.swift
//  Animation-SwiftUI
//
//  Created by Alex Fila on 23/9/24.
//

import SwiftUI

struct BoomView: View {
    
    @State private var isBoomed = false
    private let boomedParts: Int = 65
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                ForEach(0..<boomedParts, id: \.self) { _ in
                    Circle()
                        .rotation(Angle(degrees: Double.random(in: 0..<240)))
                        .frame(width: 18, height: 18)
                        .foregroundColor(.cyan)
                        .offset(x: isBoomed ? (Double.random(in: -1...1) * 400) : 0, y: isBoomed ? (Double.random(in: -1...1) * 400) : 0)
                        .opacity(isBoomed ? 0 : 1)
                        .animation(.easeInOut.speed(0.5), value: isBoomed)
                        .padding()
                }
                Circle()
                    .frame(width: 260, height: 260)
                    .foregroundColor(.pink)
                    .opacity(isBoomed ? 0 : 1)
                    .animation(.easeInOut.speed(0.5), value: isBoomed)
                    .padding()
            }
            Spacer()
            StartStopButton(animating: $isBoomed)
        }
        .navigationTitle("Boom Animation")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview { BoomView() }
