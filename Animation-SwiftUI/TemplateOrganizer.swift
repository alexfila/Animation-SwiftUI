//
//  TemplateOrganizer.swift
//  Animation-SwiftUI
//
//  Created by Alex Fila on 23/9/24.
//

import SwiftUI

enum Destination: String, CaseIterable {
    case swingby
    case swapEffect
    case basicShapes
    case scaleAnimation
    case spinAnimation
    case boomAnimation
    case wavedots
    case draggingDots
    case dancingDots

    
    @ViewBuilder
    static func view(forSelection selection: Destination) -> some View {
        switch selection {
        case .swingby:
            SwingByAnimation()
        case .swapEffect:
            SwapEffectView()
        case .basicShapes:
            BasicShapesView()
        case .scaleAnimation:
            ScaleObjectView()
        case .spinAnimation:
           SpinView()
        case .boomAnimation:
            BoomView()
        case .wavedots:
            WaveDotsView()
        case .draggingDots:
            DraggingAnimationView()
        case .dancingDots:
            DancingDotsView()
        }
    }
}

struct TemplateData {
    static var homeContent = [
        Template(
            title: "Swing By",
            description: "The object swings by other with scale",
            symbol: "arrowshape.right",
            destination: .swingby
        ),
        Template(
            title: "Swap Effect",
            description: "Swap 2 items between themself by vertical direction",
            symbol: "rectangle.2.swap",
            destination: .swapEffect
        ),
        Template(
            title: "Basic Shapes",
            description: "Experiment with different shape types.",
            symbol: "square.on.circle",
            destination: .basicShapes
        ),
        Template(
            title: "Scale Animation",
            description: "This is the example of scaling",
            symbol: "arrow.up.left.and.arrow.down.right",
            destination: .scaleAnimation
        ),
        Template(
            title: "Spin Animation",
            description: "Any object rotating 360",
            symbol: "rectangle.landscape.rotate",
            destination: .spinAnimation
        ),
        Template(
            title: "Boom Animation",
            description: "An object falls into many pieces",
            symbol: "bubbles.and.sparkles",
            destination: .boomAnimation
        ),
        Template(
            title: "Wave Dots",
            description: "Creates wave effect of multiple objects",
            symbol: "wave.3.right",
            destination: .wavedots
        ),
        Template(
            title: "Draging Animation",
            description: "Drag multiples objects with animation",
            symbol: "hand.draw.badge.ellipsis.fill",
            destination: .draggingDots
        ),
        Template(
            title: "Dancing Dots",
            description: "Explore an advanced animation that really pops.",
            symbol: "circle.grid.3x3",
            destination: .dancingDots
        )
    ]
}
