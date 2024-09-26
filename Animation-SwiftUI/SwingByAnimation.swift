//
//  SwingByAnimation.swift
//  Animation-SwiftUI
//
//  Created by Alex Fila on 23/9/24.
//

import SwiftUI

struct SwingByAnimation: View {
    @State private var isBig = false
    @State private var isCapsuleTime = false
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.gray)
                .frame(maxHeight: 330)
                .scaleEffect(isBig ? 0.8 : 0.4)
                .onTapGesture {
                    withAnimation(.bouncy) {
                        isBig.toggle()
                        isCapsuleTime.toggle()
                    }
                }
            if isCapsuleTime {
                Capsule()
                    .frame(maxWidth: 220, maxHeight: 120)
                    .foregroundColor(.mint)
                    .transition(.slide)
            }
        }
        .padding()
    }
}

#Preview { SwingByAnimation() }

