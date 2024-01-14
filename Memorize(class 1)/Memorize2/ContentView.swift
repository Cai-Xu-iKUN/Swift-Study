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
        }
        .padding()
        .foregroundColor(.red)
    }
}

#Preview {
    ContentView()
}

struct Cardview: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 5)
                Text("😀").font(.largeTitle)
            }
            else {
                RoundedRectangle(cornerRadius: 10)
                Text("hujj").font(.largeTitle)
                
            }
        }
    }
}




























