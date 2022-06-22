//
//  ContentView2.swift
//  MyPracticalWork
//
//  Created by user on 21.06.2022.
//

// SwiftUI c нуля: урок 10 - TextField, ViewModifier

import Foundation
import SwiftUI

struct ContectView2: View {
    @State var text: String = ""
    
    var body: some View{
        VStack {
            HStack {
                TextField("enter your name", text: $text)
                    .modifier(TextFieldModifer())
                
                TextField("enter your name", text: $text)
                    .modifier(TextFieldModifer())
            }
            Text("Hello World")
        }
        .frame(minWidth: 700, minHeight: 700)
    }
}

struct TextFieldModifer: ViewModifier{
    func body(content: Content) -> some View {
            content
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.red))
            .padding(.horizontal, 12)
            .textFieldStyle(.automatic)
//            Spacer()
    }
}


struct ContectView2_Previews: PreviewProvider {
    static var previews: some View {
        ContectView2()
    }
}
