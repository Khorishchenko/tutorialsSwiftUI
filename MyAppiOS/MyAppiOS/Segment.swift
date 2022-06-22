//
//  Segment.swift
//  MyAppTS
//
//  Created by user on 22.06.2022.
//

//SwiftUI c нуля: урок 5 - Segment, пишем мини интернет магазин кроссовок

import Foundation
import SwiftUI

struct Segment: View {
    @State var index = 0
    @State var offsetX = 0
    
    let company = ["Nike", "Puma", "Reеbok"]
    var sneakers = ["nike", "puma", "reеbok"]
    
    var body: some View {
        VStack {
            Text("Кросовки - \(company[index])")
                .font(Font.system(.title))
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 140)
                    .fill(Color.gray)
                    .padding()
                    .offset(x: CGFloat(offsetX))
                Image(sneakers[index])
                    .resizable()
                    .frame(width: 300, height: 300)
                    .offset(x: CGFloat(offsetX))
                Spacer()
            }.animation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3))
            
            Picker(selection: Binding(get: {
                self.index
            }, set: { newValue in
                self.index = newValue
                self.offsetX = -500
                moveBack()
            }), label:  Text("")) {
                ForEach(0..<company.count) {
                    Text(self.company[$0]).tag($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
        .frame(width: 500, height: 600)
    }
    
    private func moveBack() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            self.offsetX = 0
        }
    }
    
}

struct Segment_Previews: PreviewProvider {
    static var previews: some View {
        Segment()
    }
}
