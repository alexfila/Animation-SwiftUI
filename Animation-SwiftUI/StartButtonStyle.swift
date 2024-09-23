//
//  ShapeButtonStyle.swift
//  Animation-SwiftUI
//
//  Created by Alex Fila on 23/9/24.
//

import SwiftUI

struct ShapesButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(minWidth: 145, minHeight: 80)
            .background(Color.brown.opacity(0.23))
            .foregroundColor(.brown)
            .clipShape(RoundedRectangle(cornerRadius: 35))
            .padding(.bottom, 40)
    }
}

struct StartStopButton: View {
    @Binding var animating: Bool
    var resetOnly : Bool = false
    var action: () -> Void = { }
     
    init(animating: Binding<Bool>, resetOnly: Bool = false, action: @escaping () -> Void = {}){
        self._animating = animating
        self.resetOnly = resetOnly
        self.action = action
     }

    var body: some View {
        Button() {
            animating.toggle()
            action()
        } label: {
            if resetOnly {
                Label("Stop", systemImage: "button.angledbottom.horizontal.right.fill")
            } else {
                Label(animating ? "Stop": "Start", systemImage: animating ? "button.angledbottom.horizontal.right.fill" : "airplane")
            }
           
        }
        .buttonStyle(ShapesButton())
        
    }
}
