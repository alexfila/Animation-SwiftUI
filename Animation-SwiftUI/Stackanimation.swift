//
//  Stackanimation.swift
//  Animation-SwiftUI
//
//  Created by Alex Fila on 30/09/24.
//

import SwiftUI

struct Stackanimation: View {
    let colors: [Color] =
    [.yellow, .purple, .teal, .green, .pink, .red]
    @State private var isOn = false
    
    var body: some View {
        ZStack {
            ForEach(0..<colors.count, id: \.self) {
                Rectangle()
                    .fill(colors[$0])
                    .frame(width: 100, height: 100)
                    .cornerRadius(isOn ? CGFloat($0) * 25.0 : CGFloat($0) * 1.0)
                    .offset(x: isOn ? CGFloat($0) * 25.0 : CGFloat($0) * -25.0,
                            y: CGFloat($0) * 10.0)
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 1).delay(0.5).repeatForever(autoreverses: true)) {
                    isOn.toggle()
                }
            }
            
        }
    }
}

#Preview {
    Stackanimation()
        .preferredColorScheme(.dark)
}
