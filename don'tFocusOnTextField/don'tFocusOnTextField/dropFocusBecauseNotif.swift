//
//  dropFocusBecauseNotif.swift
//  don'tFocusOnTextField
//
//  Created by user on 12.07.2022.
//

import Foundation
import SwiftUI

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
        .contentShape(Rectangle())
        .onTapGesture {
            NotificationCenter.default.post(name: Notification.Name.dropFocus, object: nil)
        }
    }
}


struct notif: View {
    
    @State var m_text: String = ""
    @FocusState var focus: Bool
    
    var body: some View {
        VStack {
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
            
            Text(m_text)
                .padding()
        }
        .onReceive(NotificationCenter.default.publisher(for: .dropFocus)) { notif in
            if focus {
                focus.toggle()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                self.focus = false
            }
        }
        
    }
}
