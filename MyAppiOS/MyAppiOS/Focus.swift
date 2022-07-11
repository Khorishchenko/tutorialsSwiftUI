//
//  Focus.swift
//  MyAppiOS
//
//  Created by user on 11.07.2022.
//

import Foundation
import SwiftUI



struct ContentViewFocus: View {
    @State private var m_licenseKey: String = ""
    @FocusState private var useNameFocus: Bool
    @State var index: Int = 0

    var body: some View {
        VStack() {
            Text(m_licenseKey)
                .padding()
            ZStack {
                Color(UIColor.systemIndigo)
                    .edgesIgnoringSafeArea(.all)
                HStack {
                    Text("license key:")
                    
                    
                    TextField(
                        "",
                        text: $m_licenseKey
                    )
                    .background(Color.gray)
                    .disableAutocorrection(true)
                    .textFieldStyle(.roundedBorder)
                    .cornerRadius(10)
                    .focused($useNameFocus)
                    
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
//                Spacer()
        }
        .ignoresSafeArea()
        .contentShape(Rectangle())
        .onTapGesture {
          print("The whole VStack is tappable now!\(index = index + 1)")
            if useNameFocus {
                useNameFocus.toggle()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                self.useNameFocus = false
            }
        }
//        .frame(width: 700, height: 425)
    }
}
