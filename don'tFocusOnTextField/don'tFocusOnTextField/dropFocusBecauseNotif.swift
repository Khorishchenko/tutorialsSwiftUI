// TODO: Description
// Сейчас если кликнуть на TextView, он фокусируется(т.е. выделяется синим), но фокус не сбрасывается если кликнуть вне TextView.
// Проверить что работает если кликнуть на бэкграунд, и если кликнуть на другие элементы - фокус сбрасывается тоже.
// Нужно разресерчить решение, и написать тестовый проект, который решает эту проблему.
// Не интегрировать решение в проект OrkaDekstop
// Не использовать сторонних либ, пытаться только через SwiftUI

import Foundation
import SwiftUI
import Cocoa



// TODO: The best solution

public extension Notification.Name {
    static let dropFocus = Notification.Name.init("dropFocus")
}

struct Clic: View {
    
    @State var m_text: String = ""
    
    var body: some View {
        VStack {
            OTextField2(saveText: $m_text)
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
                .frame(width: 220, height: 20, alignment: .center)
                
        }
        .frame(width: 700, height: 425)
        .fixedSize()
        .onAppear()
        {
            // TODO: We find out the coordinates of the click
            NSEvent.addLocalMonitorForEvents(matching: [.leftMouseDown]) { obj in
                NotificationCenter.default.post(name: Notification.Name.dropFocus, object: (x: obj.locationInWindow.x, y: obj.locationInWindow.y))
                
                return obj
            }
        }
    }
}

// TODO: Implementation of rectangle for resetting focus

struct OTextField2: View {
    
    @FocusState private var m_stateFocus: Bool
    @Binding private var m_saveText: String
    
    init(saveText: Binding<String>) {
        _m_saveText = saveText
    }
    
    var body: some View {
        GeometryReader { geometry in
            Group {
                TextField(
                    "",
                    text: $m_saveText
                )
                .focused($m_stateFocus)
            }
            .onReceive(NotificationCenter.default.publisher(for: .dropFocus)) { notif in
                let frame = geometry.frame(in: CoordinateSpace.global)
                
                
                // TODO: An implementation of checking whether a click is in the range of a rectangle
                
                if let data = notif.object as? (x: CGFloat, y: CGFloat)
                {
                    // TODO: the formula for calculating the coincidence of the coordinates of the click and the TextField
                    if m_stateFocus && !((data.y >= (CGFloat(425) - frame.minY)) && (data.y <= ((CGFloat(425) - frame.minY) + frame.height)) && ((data.x >= frame.minX) && (data.x <= (frame.minX + frame.width))))
                    {
                        m_stateFocus.toggle()
                    }
                }
            }
        }
    }
}
