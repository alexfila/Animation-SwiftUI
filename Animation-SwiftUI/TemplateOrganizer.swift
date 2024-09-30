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
    case configurationshape
    case scaleAnimation
    case spinAnimation
    case boomAnimation
    case wavedots
    case draggingDots
    case upandDown
    case reactions
    case giftanimation
    case stackAnimation
    case wwdcletters

    
    @ViewBuilder
    static func view(forSelection selection: Destination) -> some View {
        switch selection {
        case .stackAnimation:
            Stackanimation()
        case .swingby:
            SwingByAnimation()
        case .swapEffect:
            SwapEffectView()
        case .configurationshape:
            ConfigurationView()
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
        case .upandDown:
            UpAndDown()
        case .reactions:
            ReactionsView()
                .preferredColorScheme(.dark)
        case .giftanimation:
            GiftAnimation()
                .preferredColorScheme(.dark)
        case .wwdcletters
        }
    }
}

struct TemplateData {
    static var homeContent = [
        Template(
            title: "Gift Animation",
            description: "It's 3D animation with Gift on top",
            symbol: "gift",
            destination: .giftanimation
        ),
        Template(
            title: "Reactions Emoji",
            description: "Buttons with different animation",
            symbol: "face.dashed",
            destination: .reactions
        ),
        Template(
            title: "Up and Down Animation",
            description: "Slight jump for buttons",
            symbol: "arrowshape.up",
            destination: .upandDown
        ),
        Template(
            title: "Stack Animation",
            description: "Multiple objects are stacked and moving",
            symbol: "play.square.stack",
            destination: .stackAnimation
        ),
        Template(
            title: "WWDC letters",
            description: "WWCD letters with multicolor animation",
            symbol: "w.square",
            destination: .wwdcletters
        ),
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
            title: "Configuration",
            description: "Configuration prototype with some options",
            symbol: "opticaldisc",
            destination: .configurationshape
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
    ]
}
