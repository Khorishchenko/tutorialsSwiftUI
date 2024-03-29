//
//  DragGesture.swift
//  don'tFocusOnTextField
//
//  Created by user on 19.07.2022.
//

import Foundation
import SwiftUI
import Cocoa


struct Example: View {
    @GestureState private var startPosition: CGPoint = .zero
    @GestureState private var translation: CGSize = .zero
    
    var body: some View {
        Rectangle()
            .fill(Color.yellow)
            .frame(width: 600, height: 400)
            .coordinateSpace(name: "rectangle")
            .overlay(coordinates)
            .gesture(dragGesture)
    }
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 5, coordinateSpace: .named("rectangle"))
            .updating($startPosition) { (value, state, _) in
                state = value.startLocation
            }
            .updating($translation) { (value, state, _) in
                state = value.translation
            }
    }
    
    var coordinates: some View {
        Text("\(startPosition.x) \(startPosition.y) \(translation.width) \(translation.height)")
            .foregroundColor(.black)
            .font(Font.body.monospacedDigit())
    }
}
