//
//  ScaleObject.swift
//  Animation-SwiftUI
//
//  Created by Alex Fila on 23/9/24.
//

import SwiftUI

struct Object: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY ))
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.height/4),
                      control1:CGPoint(x: rect.midX, y: rect.height*4/4),
                      control2: CGPoint(x: rect.minX, y: rect.midY))
        path.addArc(center: CGPoint( x: rect.width/4,y: rect.height/4),
                    radius: (rect.width/4),
                    startAngle: Angle(radians: Double.pi),
                    endAngle: Angle(radians: 0),
                    clockwise: false)
        path.addArc(center: CGPoint( x: rect.width * 3/4,y: rect.height/4),
                    radius: (rect.width/4),
                    startAngle: Angle(radians: Double.pi),
                    endAngle: Angle(radians: 0),
                    clockwise: false)
        path.addCurve(to: CGPoint(x: rect.midX, y: rect.height),
                      control1: CGPoint(x: rect.width, y: rect.midY),
                      control2: CGPoint(x: rect.midX, y: rect.height*4/4))
        return path
    }
}

struct StopHeart: View {
    var body: some View {
        Object()
            .frame(width: 150, height: 150)
            .foregroundColor(.blue)
            .shadow(color: .pink, radius: 12)
            .frame(width: 300, height: 300)
           
    }
}

struct ScaledHeart: View {
    @State private var heartScale: CGFloat = 1
    var body: some View {
        Object()
            .frame(width: 150, height: 150)
            .foregroundColor(.blue)
            .scaleEffect(heartScale)
            .shadow(color: .green, radius: 12)
            .onAppear{
                withAnimation(.easeInOut.repeatForever(autoreverses: true)) {
                    heartScale = 1.7 * heartScale
                }
            }
    }
}

struct ScaleObjectView: View {
    @State private var scaling = false
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                if scaling {
                    ScaledHeart()
                } else {
                    StopHeart()
                }
            }
            Spacer()
            StartStopButton(animating: $scaling)
        }
        .navigationTitle("ScaleObject")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview { ScaleObjectView() }
