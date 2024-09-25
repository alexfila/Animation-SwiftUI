//
//  SwapEffect.swift
//  Animation-SwiftUI
//
//  Created by Alex Fila on 23/9/24.
//

import SwiftUI

struct SwapEffectView: View {
    @State var swap = false
    @Namespace private var figureTransition
    
    private func rectangle() -> some View {
        Rectangle()
            .fill(.red)
            .frame(width: 144, height: 144)
            .matchedGeometryEffect(id: "Rectangle", in: figureTransition)
        
    }
    
    private func ellipse() -> some View {
        Ellipse()
            .fill(.green)
            .frame(width: 200, height: 150)
            .matchedGeometryEffect(id: "Ellipse", in: figureTransition)
    }

    var body: some View {
        VStack{
            if swap {
                rectangle()
                ellipse()
                
            } else {
                ellipse()
                rectangle()
                
            }
        }
        .padding()
        .onTapGesture {
            withAnimation {
                swap.toggle()
            }
        }
    }
}

#Preview { SwapEffectView() }
