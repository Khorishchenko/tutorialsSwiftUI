//
//  dropFocusBecauseNotif.swift
//  don'tFocusOnTextField
//
//  Created by user on 12.07.2022.
//

import Foundation
import SwiftUI
import Cocoa

public extension Notification.Name {
    static let dropFocus = Notification.Name.init("dropFocus")
}

struct Notif: View {
    

   
    
    var body: some View {
        Group {
            notif()
                .frame(width: 700, height: 425)
                .fixedSize()
        }
        .onAppear() {
            NSEvent.addLocalMonitorForEvents(matching: [.leftMouseDown]) { obj in
                
                print(obj.locationInWindow.x, obj.locationInWindow.y)
                let Point = (x: CGFloat(obj.locationInWindow.x), y: CGFloat(obj.locationInWindow.y))
                NotificationCenter.default.post(name: Notification.Name.dropFocus, object: Point)
                
                return obj
            }
        }
    }
}

struct notif: View {
    
    @State var m_text: String = ""
    @FocusState var focus: Bool
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                Group {
                    TextField(
                        "",
                        text: $m_text
                    )
                    .background(Color.gray)
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                    .cornerRadius(10)
                    .padding()
                    .focused($focus)
                    
                    
                }
                .onReceive(NotificationCenter.default.publisher(for: .dropFocus)) { notif in
                    if var data = notif.object {
                        print(data)
                        
                        print(notif)
                        
                        let frame = geometry.frame(in: CoordinateSpace.local)
                        
                        let frame2 = (x: frame.midX, y: frame.midY )
                        print(frame2)
                        
                        data = (x: 350.0, y: 212.5)
                        
                        if focus && data as! (CGFloat, CGFloat) != frame2 {
                            focus.toggle()
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                        self.focus = false
                    }
                }
            }
        }
    }
}

//class ViewController: NSViewController {
//
//    var mouseLocation: NSPoint { NSEvent.mouseLocation }
//
//    override func viewDidLoad() {
//
//        super.viewDidLoad()
//        NSEvent.addLocalMonitorForEvents(matching: [.leftMouseDown]) {
//            print("mouseLocation:", String(format: "%.1f, %.1f", self.mouseLocation.x, self.mouseLocation.y))
//            NotificationCenter.default.post(name: Notification.Name.dropFocus, object: self.mouseLocation)
//            return $0
//        }
//    }
//}
