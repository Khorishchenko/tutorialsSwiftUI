//
//  ContentView.swift
//  don'tFocusOnTextField
//
//  Created by user on 06.07.2022.
//

import SwiftUI


struct ContentView: View {
    @State private var m_licenseKey: String = ""
    @FocusState private var useNameFocus: Bool

    var body: some View {
        VStack(spacing:20) {
            Text(m_licenseKey)
                .padding()
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

//                  TODO: drop focus on TextField because Mouse hover

                    .onHover { hover in
                            print("Mouse hover: \(hover)")
                        if hover {
                            self.useNameFocus = false
                        }
                        else {
                            self.useNameFocus = false
                        }
                    }

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
                Spacer()
        }
//        .contentShape(Rectangle())
//        .onTapGesture {
//          print("The whole VStack is tappable now!")
//            if useNameFocus {
//                useNameFocus.toggle()
//            }
//        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                self.useNameFocus = false
            }
        }
        .frame(width: 700, height: 425)
    }
}

//struct ContentView2: View {
//    var body: some View {
//        VStack(spacing: 4) {
//            HStack {
//                Image(systemName: "heart")
//                Image(systemName: "heart")
//                    .environment(\.symbolVariants, .none)
//            }
//            .symbolVariant(.fill)
//
//            Image(systemName: "antenna.radiowaves.left.and.right")
//            Text("Connected")
//            Spacer()
//        }
//        .contentShape(Rectangle())
//        .onTapGesture {
//            print("The whole VStack is tappable now!")
//        }
//        .frame(width: 400, height: 400)
//    }
//}

//
//struct LoginForm : View {
//    enum Field: Hashable {
//        case username
//        case password
//    }
//
//    @State private var username = ""
//    @State private var password = ""
//    @FocusState private var focusedField: Field?
//
//    var body: some View {
//        Form {
//            TextField("Username", text: $username)
//                .focused($focusedField, equals: .username)
//
//            SecureField("Password", text: $password)
//                .focused($focusedField, equals: .password)
//
//            Button("Sign In") {
//                if username.isEmpty {
//                    focusedField = .username
//                } else if password.isEmpty {
//                    focusedField = .password
//                }
//            }
//        }
//    }
//}
