//
//  ContentView.swift
//  unitTestsInSwift
//
//  Created by user on 22.06.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

class UnitTest {
    
    func sum(a: Int, b: Int) -> Int {
        return a + b;
    }
    
    func minus(a: Int, b: Int) -> Int {
        return a - b;
    }
    
    func divide(a: Int, b: Int) -> Int {
        return a / b;
    }
    
    func multiply(a: Int, b: Int) -> Int {
        return a * b;
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
