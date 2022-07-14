//
//  AnotherAttemptToImplementDropFocus.swift
//  don'tFocusOnTextField
//
//  Created by user on 13.07.2022.
//

import Foundation
import SwiftUI


struct ContentViewOTextField: View {
    @State private var m_licenseKey: String = ""
    @FocusState private var useNameFocus: Bool

    var body: some View {
        VStack(spacing:20) {
            Text(m_licenseKey)
                .padding()
                HStack {
                    Text("license key:")

                    OTextField(saveText: $m_licenseKey)

                    Button(action: {
    //              TODO: dont focus on TextField because clic Button
                        if useNameFocus {
                            useNameFocus.toggle()
                        }
                        if m_licenseKey.count < 3 {
                            print("Not OK")
                        }
                        else {
                            print("OK")
                        }
                    }, label: {
                        Text("􁚡")
                            .foregroundColor(Color.red)
                    })
                    .padding(10)
                }
        }
        .frame(width: 700, height: 425)
    }
}


struct OTextField: View {
    
    @FocusState private var m_stateFocus: Bool
    @Binding private var m_saveText: String
    
    init(saveText: Binding<String>){
        _m_saveText = saveText
    }
    
    var body: some View {
        Group {
            TextField(
                "",
                text: $m_saveText
            )
            .background(Color.gray)
            .disableAutocorrection(true)
            .textFieldStyle(.roundedBorder)
            .cornerRadius(10)
            .focused($m_stateFocus)
            Spacer()
            
        }
        .contentShape(Rectangle())
        .onTapGesture {
          print("The whole VStack is tappable now!")
            if m_stateFocus {
                m_stateFocus.toggle()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                self.m_stateFocus = false
            }
        }
    }
}
