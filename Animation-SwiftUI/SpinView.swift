//
//  SpinView.swift
//  Animation-SwiftUI
//
//  Created by Alex Fila on 23/9/24.
//

import SwiftUI

struct ResetRectangle: View {
    var body: some View {
        Rectangle()
            .frame(width: 150, height: 150)
            .foregroundColor(.teal)
    }
}
struct SpinningRectangle: View {
        @State private var width: CGFloat = 150

        var body: some View {
            Rectangle()
                .frame(width: width, height: 150)
                .foregroundColor(.teal)
                .onAppear {
                    withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(2)) {
                        width = 0
                    }
                }
        }
}
struct SpinView: View {
    @State private var isRotating = false
    
    var body: some View {
        VStack {
            Spacer()
            if isRotating {
                SpinningRectangle()
            } else {
                ResetRectangle()
            }
            Spacer()
            StartStopButton(animating: $isRotating)
        }
        .navigationTitle("Spin Animation")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct SpinView_Previews: PreviewProvider {
    static var previews: some View {
        SpinView()
    }
}


