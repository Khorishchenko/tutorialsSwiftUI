//
//  ContentView.swift
//  MyAppTS
//
//  Created by user on 20.06.2022.
//

// limitText TextField

import Foundation
import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .navigationTitle("Test FileText")
        }
    }
}

struct Home: View {
    
    var characterLimit = 15
    @State var isTapped = false
    
    @State var text = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 4, content: {
                HStack(spacing: 15) {
                    TextField("", text: $text)
                    { (status) in
                        if status {
                            withAnimation(.easeIn){
                                isTapped = true
                            }
                        }
                    } onCommit: {
                        if text == "" {
                            withAnimation(.easeIn) {
                                isTapped = false
                            }
                        }
                    }
                }
                .limitText($text, to: 15)
                .onChange(of: text) { _ in
                    text = String(text.prefix(characterLimit))
                }
                .padding(.top,isTapped ? 15 : 0)
                .
                background(){
                    Text("User Name")
                        .scaleEffect(isTapped ? 0.8 : 1)
                        .offset(x:isTapped ? -7 : 0, y: isTapped ? -1 : 0)
                        .foregroundColor(.gray)
                }
            })
            .padding(.vertical, 24)
            .padding(.horizontal, 20)
            .background(Color.gray.opacity(0.09))
            .cornerRadius(5)
            
            HStack {
                Spacer()
                Text("\(text.count)/15")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.trailing)
                    .padding(.top, 5)
            }
        }
        .padding()
    }
}

extension View {
    func limitText(_ text: Binding<String>, to characterLimit: Int) -> some View {
        self
            .onChange(of: text.wrappedValue) { _ in
                text.wrappedValue = String(text.wrappedValue.prefix(characterLimit))
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

