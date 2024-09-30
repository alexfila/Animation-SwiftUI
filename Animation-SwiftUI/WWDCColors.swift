//
//  WWDCColors.swift
//  Animation-SwiftUI
//
//  Created by Alex Fila on 30/09/24.
//

import SwiftUI

struct WWDCColors: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(.ww)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .phaseAnimator([false, true]) { ww, chromaRotate in
                    ww
                        .scaleEffect(1, anchor: chromaRotate ? .bottom : .topTrailing)
                        .hueRotation(.degrees(chromaRotate ? 600 : 0))
                    
                } animation: { chromaRotate in
                        .easeInOut(duration: 3)
                }
            Image(.dc)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .phaseAnimator([true, false]) { dc, chromaRotate in
                    dc
                        .scaleEffect(1, anchor: chromaRotate ? .top : .bottom)
                        .rotationEffect(.degrees(0), anchor: chromaRotate ? .leading : .trailing)
                        .hueRotation(.degrees(chromaRotate ? -300 : 0))
                    
                } animation: { chromaRotate in
                        .easeInOut(duration: 2)
                }
            Image(.tweentyFour)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .phaseAnimator([false, true]) { tweentyFour, chromaRotate in
                    tweentyFour
                        .scaleEffect(1, anchor: chromaRotate ? .trailing : .topLeading)
                        .hueRotation(.degrees(chromaRotate ? 400 : 0))
                        .rotationEffect(.degrees(0), anchor: chromaRotate ? .bottom : .trailing)
                } animation: { chromaRotate in
                        .easeIn(duration: 2)
                }
        }
    }
}

#Preview {
    WWDCColors()
        .preferredColorScheme(.dark)
}
