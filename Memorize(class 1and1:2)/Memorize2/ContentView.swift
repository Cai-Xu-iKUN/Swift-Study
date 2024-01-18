//
//  ContentView.swift
//  Memorize2
//
//  Created by user249939 on 15/1/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            Cardview()
            Cardview(isFaceUp: true)
            Cardview()
            Cardview(isFaceUp: true)
        }
        .padding()
        .foregroundColor(.red)
    }
}

#Preview {
    ContentView()
}

struct Cardview: View {
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack(alignment: .center) {
            var base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.strokeBorder(lineWidth: 5)
                Text("🐔").font(.largeTitle)
            }
            else {
                base.fill()
                
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}




























