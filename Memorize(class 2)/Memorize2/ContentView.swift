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
            ScrollView {
                cards
            }
            Spacer()
            .foregroundColor(.green)
            cardCountAdjusters
            
        }
        .padding()
        
        
        
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self){ index in
                Cardview(Content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            
        }
        .foregroundColor(.blue)
    }
    
    var cardCountAdjusters: some View {
        HStack{
            cardAdder
            Spacer()
            cardRemover
        }
        
    }
    func cardCoundAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Text(Image(systemName: symbol))
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
        
    }
    var cardAdder: some View {
            cardCoundAdjuster(by: 1, symbol: "plus")
        }

    var cardRemover: some View{
        cardCoundAdjuster(by: -1, symbol: "minus")
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
            @State var base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            Group {
                base.strokeBorder(lineWidth: 5)
                Text(Content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}




























