//
//  DropFocus3.swift
//  don'tFocusOnTextField
//
//  Created by user on 12.07.2022.
//

import Foundation
import SwiftUI


struct ContentView2: View {
    var body: some View {
        VStack(spacing: 4) {
            HStack {
                Image(systemName: "heart")
                Image(systemName: "heart")
                    .environment(\.symbolVariants, .none)
            }
            .symbolVariant(.fill)

            Image(systemName: "antenna.radiowaves.left.and.right")
            Text("Connected")
            Spacer()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("The whole VStack is tappable now!")
        }
        .frame(width: 400, height: 400)
    }
}


struct LoginForm : View {
    enum Field: Hashable {
        case username
        case password
    }

    @State private var username = ""
    @State private var password = ""
    @FocusState private var focusedField: Field?

    var body: some View {
        Form {
            TextField("Username", text: $username)
                .focused($focusedField, equals: .username)

            SecureField("Password", text: $password)
                .focused($focusedField, equals: .password)

            Button("Sign In") {
                if username.isEmpty {
                    focusedField = .username
                } else if password.isEmpty {
                    focusedField = .password
                }
            }
        }
    }
}
