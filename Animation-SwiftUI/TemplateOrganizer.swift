//
//  TopicOrganizer.swift
//  Animation-SwiftUI
//
//  Created by Alex Fila on 23/9/24.
//

import SwiftUI

enum Destination: String, CaseIterable {
    case basicShapes
    case simpleAnimation
    case spinningAnimation
    case explodingAnimation
    case rollingRainbow
    case dragnDropDots
    case dancingDots

    
    @ViewBuilder
    static func view(forSelection selection: Destination) -> some View {
        switch selection {
        case .basicShapes:
            BasicShapesView()
        case .simpleAnimation:
            HeartPulseView()
        case .spinningAnimation:
           SpinningView()
        case .explodingAnimation:
           ExplodingView()
        case .rollingRainbow:
            RollinRainbowView()
        case .dragnDropDots:
            DragNDropDotsView()
        case .dancingDots:
            DancingDotsView()
        }
    }
}

struct TopicData {
    static var homeContent = [
        Template(
            title: "Basic Shapes",
            description: "Experiment with different shape types.",
            symbol: "square.on.circle",
            destination: .basicShapes
        ),
        Template(
            title: "Basic Animation",
            description: "See an example of a basic animation.",
            symbol: "heart",
            destination: .simpleAnimation
        ),
        Template(
            title: "Spinning Animation",
            description: "View a basic shape spinning on its x axis.",
            symbol: "arrow.left.arrow.right.circle",
            destination: .spinningAnimation
        ),
        Template(
            title: "Explosion Animation",
            description: "Tap to explode a rectangle into many pieces.",
            symbol: "sparkles",
            destination: .explodingAnimation
        ),
        
        Template(
            title: "Rollin' Rainbow",
            description: "Explore an animation that makes a wave.",
            symbol: "wind",
            destination: .rollingRainbow
        ),
        Template(
            title: "Drag N' Drop It",
            description: "Use a drag gesture to move and animate a grid view.",
            symbol: "hand.draw",
            destination: .dragnDropDots
        ),
        Template(
            title: "Dancing Dots",
            description: "Explore an advanced animation that really pops.",
            symbol: "circle.grid.3x3",
            destination: .dancingDots
        )
    ]
}
