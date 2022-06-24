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

enum classTestError: LocalizedError {
    case tetsThrows
    
    public var errorDescription: String?
    {
        switch self {
        case .tetsThrows:
            return NSLocalizedString("Test throws", comment: "Test" )
        }
    }
}

class UnitTest: LocalizedError {
    
    func trueFalse(m_value: Int) throws -> Bool {
        
        if m_value == 0 {
            return false
        }
        else if m_value < 0 {
            throw classTestError.tetsThrows
        }
        else {
            return true
        }
    }
    
    func sum(m_value1: Int, m_value2: Int) -> Int {
        return m_value1 + m_value2;
    }
    
    func minus(m_value1: Int, m_value2: Int) -> Int {
        return m_value1 - m_value2;
    }
    
    func divide(m_value1: Int, m_value2: Int) -> Int {
        return m_value1 / m_value2;
    }
    
    func multiply(m_value1: Int, m_value2: Int) -> Int {
        return m_value1 * m_value2;
    }
}
