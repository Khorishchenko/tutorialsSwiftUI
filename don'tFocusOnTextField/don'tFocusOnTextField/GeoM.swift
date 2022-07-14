//
//  GeoM.swift
//  don'tFocusOnTextField
//
//  Created by user on 15.07.2022.
//
import SwiftUI

struct ExampleView: View {
    struct SomeView: View {
        var body: some View {
            Rectangle()
                .fill(Color.red)
                .frame(width: 500, height: 500)
        }
    }

    @State var someFrame: CGRect? // will be updated after the first layout pass

    var body: some View {
        VStack {
            SomeView()
                .frame(width: 500, height: 500)
                .modifier(GetGlobalFrame(globalFrame: $someFrame))

            Text("Hello, World! ")
        }
    }
}

struct GetGlobalFrame: ViewModifier {
    @Binding var globalFrame: CGRect?

    func body(content: Content) -> some View {
        content.background(
            GeometryReader { (proxy: GeometryProxy) -> EmptyView in
                if globalFrame != proxy.frame(in: .global) {
                    DispatchQueue.main.async {
                        globalFrame = proxy.frame(in: .global)
                    }
                }

                return EmptyView()
            }
        )
    }
}
