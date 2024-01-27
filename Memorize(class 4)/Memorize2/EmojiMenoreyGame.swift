//
//  EmojiMenoreyGame.swift
//  Memorize2
//
//  Created by user249939 on 22/1/2024.
//

import SwiftUI

class EmojiMenoreyGame: ObservableObject {
    static let emojis = ["🐔", "👩", "🪆", "📺", "😺", "🎃", "😈", "🤑", "🤮", "😴", "🤤"]
    
    

    private static func createMemoreyGame() -> MemoryGame<String>{
        return MemoryGame(numberOfPairsOfCards: 16) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairindex]
            } else {
                return "👀"
            }
        }
    
    }
        
    @Published private var model = createMemoreyGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    // MARK: - Intents
    func shuffle() {
        model.shuffle()
        objectWillChange.send()
        
    }
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}






















