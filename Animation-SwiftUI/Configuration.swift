//
//  Configuration.swift
//  Animation-SwiftUI
//
//  Created by Alex Fila on 23/9/24.
//

import SwiftUI

struct ConfigurationView: View {
    @State private var cutStart : Double = 0
    @State private var cutEnd : Double = 1
    @State private var width : Double = 1
    @State private var height : Double = 1
    @State private var selectedShape : ShapeType = .circle

    var body: some View {
        VStack {
            Text(selectedShape.rawValue)
                .font(.title)
                .padding(.top, 25)
            
            TabView(selection: $selectedShape) {
                Group {
                    Object()
                        .trim(from: cutStart, to: cutEnd)
                        .tag(ShapeType.customPath)
                        
                    RoundedRectangle(cornerRadius: 20)
                        .trim(from: cutStart, to: cutEnd)
                        .tag(ShapeType.roundedRectangle)

                    Ellipse()
                        .trim(from: cutStart, to: cutEnd)
                        .tag(ShapeType.ellipse)
                    
                    Capsule()
                        .trim(from: cutStart, to: cutEnd)
                        .tag(ShapeType.capsule)
                    
                    Rectangle()
                        .trim(from: cutStart, to: cutEnd)
                        .tag(ShapeType.rectangle)

                    Circle()
                        .trim(from: cutStart, to: cutEnd)
                        .tag(ShapeType.circle)
                }
                .foregroundStyle(LinearGradient(colors: [.indigo, .teal], startPoint: .bottom, endPoint: .top))
                .frame(maxWidth: width * 180, maxHeight: height * 180)
                .padding()
                .padding(.bottom, 45)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
         
            Group {
                HStack {
                    Text("Cut Start")
                    Slider(value: $cutStart)
                }
                
                HStack {
                    Text("Cut End")
                    Slider(value: $cutEnd)
                }
                
                HStack {
                    Text("Width")
                    Slider(value: $width)
                }
                
                HStack {
                    Text("Height")
                    Slider(value: $height)
                }
                

            }
            .padding(.vertical, 10)
        }
        .padding()
        .navigationTitle("Basic Shapes")
        .navigationBarTitleDisplayMode(.inline)
    }
}

enum ShapeType : String {
    case customPath = "Object"
    case roundedRectangle = "Rounded Rectangle"
    case rectangle = "Rectangle"
    case ellipse = "Ellipse"
    case capsule = "Capsule"
    case circle = "Circle"
}

#Preview { ConfigurationView() }
