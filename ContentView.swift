//
//  ContentView.swift
//  MyPracticalWork
//
//  Created by user on 19.06.2022.
//
import SwiftUI

class TextLimiter: ObservableObject {
    private let limit: Int
    
    init(limit: Int = 5) {
        self.limit = limit
    }
    
    @Published var value = "" {
        didSet {
            if value.count > self.limit && oldValue.count <= self.limit{
                value = oldValue
            }
        }
    }
}

struct ContentView: View {
    @ObservedObject var input = TextLimiter(limit: 5)
    
    var body: some View {
        TextField("Text Input",
            text: $input.value)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
