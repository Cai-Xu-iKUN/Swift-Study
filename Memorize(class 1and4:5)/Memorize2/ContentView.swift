//
//  ContentView.swift
//  Memorize2
//
//  Created by user249939 on 15/1/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["🐔", "👩", "🪆", "📺", "😺", "🎃", "😈", "🤑", "🤮", "😴", "🤤"]
    
    @State var cardCount: Int = 4
    var body: some View {
        VStack{
            HStack{
                ForEach(0..<cardCount, id: \.self){ index in
                    Cardview(Content: emojis[index])
                }
            }
            .foregroundColor(.green)
            HStack{
                Button(action: {
                    cardCount += 1
                    
                }, label: {
                    Text(Image(systemName: "plus"))
                })
               
                Spacer()
                Button(action: {
                    cardCount -= 1
                    
                }, label: {
                    Text(Image(systemName: "minus"))
                })
                
            }
            
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}

struct Cardview: View {
    let Content: String
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack(alignment: .center) {
            var base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.strokeBorder(lineWidth: 5)
                Text(Content).font(.largeTitle)
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




























