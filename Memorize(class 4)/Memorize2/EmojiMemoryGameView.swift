//
//  EmojiMemoryGameView.swift
//  Memorize2
//
//  Created by user249939 on 15/1/2024.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMenoreyGame
    
    @State var cardCount: Int = 4
    var body: some View {
        VStack{
            ScrollView {
                cards
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
//            Spacer()
//            .foregroundColor(.green)
//            cardCountAdjusters
            
        }
        .padding()
        
        
        
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self){ index in
                Cardview(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
            
        }
        .foregroundColor(Color.orange)
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
        .disabled(cardCount + offset < 1 || cardCount + offset > EmojiMenoreyGame.emojis.count)
        
    }
    var cardAdder: some View {
            cardCoundAdjuster(by: 1, symbol: "plus")
        }

    var cardRemover: some View{
        cardCoundAdjuster(by: -1, symbol: "minus")
    }
}



struct Cardview: View {
    let card: MemoryGame<String>.Card
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            @State var base: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            Group {
                base.strokeBorder(lineWidth: 5)
                Text(card.content).font(.system(size: 200)).minimumScaleFactor(0.01).aspectRatio(1, contentMode: .fit)
            }
                .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
    }
}



#Preview {
    EmojiMemoryGameView(viewModel: EmojiMenoreyGame())
}

























