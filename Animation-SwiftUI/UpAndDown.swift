//
//  UpAndDown.swift
//  Animation-SwiftUI
//
//  Created by Alex Fila on 28/09/24.
//

import SwiftUI

extension View {
    func jumpAndFall(trigger: Binding<Int>) -> some View {
        self.modifier(ReactionAnimationModifier(reactionCount: trigger))
    }
}
// Define the properties that will drive the animations. Create a new struct to contain all the properties that will be independently animated.
struct ReactionAnimationProps {
    var scale = 1.0
    var verticalStretch = 1.0
    var verticalTranslation = 0.0
    var angle = Angle.zero
    var chromaAngle = Angle.zero
}

struct ReactionAnimationModifier: ViewModifier {
    @Binding var reactionCount: Int

    func body(content: Content) -> some View {
        content
            .keyframeAnimator(
                // Provide an instance of the struct
                initialValue: ReactionAnimationProps(), trigger: reactionCount) { content, value in
                    content
                    // Apply modifiers on the view for each of the properties of the struct
                        .rotationEffect(value.angle)
                        .hueRotation(value.chromaAngle)
                        .scaleEffect(value.scale)
                        .scaleEffect(y: value.verticalStretch)
                        .offset(y: value.verticalTranslation)
                } keyframes: { _ in
                    // Provide the keyframe track for the different properties you are animating. You should specify them with a key path.
                    KeyframeTrack(\.angle) {
                        CubicKeyframe(.zero, duration: 0.58)
                        CubicKeyframe(.degrees(16), duration: 0.125)
                        CubicKeyframe(.degrees(-16), duration: 0.125)
                        CubicKeyframe(.degrees(16), duration: 0.125)
                        CubicKeyframe(.zero, duration: 0.125)
                    }

                    KeyframeTrack(\.verticalStretch) {
                        CubicKeyframe(1.0, duration: 0.1)
                        CubicKeyframe(0.6, duration: 0.15)
                        CubicKeyframe(1.5, duration: 0.1)
                        CubicKeyframe(1.05, duration: 0.15)
                        CubicKeyframe(1.0, duration: 0.88)
                        CubicKeyframe(0.8, duration: 0.1)
                        CubicKeyframe(1.04, duration: 0.4)
                        CubicKeyframe(1.0, duration: 0.22)
                    }

                    KeyframeTrack(\.scale) {
                        // Specify the keyframe timing curve
                        LinearKeyframe(1.0, duration: 0.36)
                        SpringKeyframe(2.0, duration: 0.8, spring: .bouncy)
                        SpringKeyframe(1, spring: .bouncy)
                    }

                    KeyframeTrack(\.verticalTranslation) {
                        LinearKeyframe(0.0, duration: 0.1)
                        SpringKeyframe(20.0, duration: 0.15, spring: .bouncy)
                        SpringKeyframe(-60.0, duration: 1.0, spring: .bouncy)
                        SpringKeyframe(0.0, spring: .bouncy)
                    }

                    KeyframeTrack(\.chromaAngle) {
                        LinearKeyframe(.zero, duration: 0.58)
                        LinearKeyframe(.degrees(45), duration: 0.125)
                        LinearKeyframe(.degrees(-30), duration: 0.125)
                        LinearKeyframe(.degrees(150), duration: 0.125)
                        LinearKeyframe(.zero, duration: 0.125)
                    }
                }
    }
}

// Example usage:
struct UpAndDown: View {
    
    @State private var heartReactionCount = 0
    @State private var upReactionCount = 0
    @State private var downReactionCount = 0
    @State private var lolReactionCount = 0
    @State private var wutReactionCount = 0
    
    var body: some View {
        HStack {
            Button {
                heartReactionCount += 1
            } label: {
                Image(.loveReaction)
            }
            .jumpAndFall(trigger: $heartReactionCount)
            
            Button {
                upReactionCount += 1
            } label: {
                Image(.thumbsupReaction)
            }
            .jumpAndFall(trigger: $upReactionCount)
            
            Button {
                downReactionCount += 1
            } label: {
                Image(.thumbsdownReaction)
            }
            .jumpAndFall(trigger: $downReactionCount)
            
            Button {
                lolReactionCount += 1
            } label: {
                Image(.lolReaction)
            }
            .jumpAndFall(trigger: $lolReactionCount)
            
            Button {
                wutReactionCount += 1
            } label: {
                Image(.wutReaction)
            }
            .jumpAndFall(trigger: $wutReactionCount)
        }
    }
}

#Preview { UpAndDown() }
