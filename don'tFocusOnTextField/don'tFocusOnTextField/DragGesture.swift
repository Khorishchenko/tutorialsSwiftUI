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

//class AppDelegate: NSObject, NSApplicationDelegate {
//
//    @IBOutlet weak var window: NSWindow!
//
//    var mouseLocation: NSPoint {
//        return NSEvent.mouseLocation()
//    }
//
//    func applicationDidFinishLaunching(aNotification: NSNotification) {
//        // Insert code here to initialize your application
//        println( "Mouse Location X,Y = \(mouseLocation)" )
//        println( "Mouse Location X = \(mouseLocation.x)" )
//        println( "Mouse Location Y = \(mouseLocation.y)" )
//    }
//
//    func applicationWillTerminate(aNotification: NSNotification) {
//        // Insert code here to tear down your application
//    }
//}
//
//import Cocoa
//
//class DrawLine: NSView {
//    var startPoint:NSPoint?
//    var endPoint:NSPoint?
//    override func mouseDown(with event: NSEvent){
//        if startPoint == nil || self.endPoint != nil {
//           self.startPoint = event.locationInWindow
//        } else {
//          self.endPoint = event.locationInWindow
//          self.needsDisplay = true
//        }
//    }
//
//    override func draw(_ dirtyRect: NSRect) {
//        if let theStart = startPoint, let theEnd = endPoint {
//           NSBezierPath.strokeLine(from: theStart, to: theEnd)
//        }
//    }
//}
