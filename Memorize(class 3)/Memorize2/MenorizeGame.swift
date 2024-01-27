//
//  MenorizeGame.swift
//  Memorize2
//
//  Created by user249939 on 22/1/2024.
//

import Foundation

struct MemoryGame<CardContent> {
    var card: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
    
}


















