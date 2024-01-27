//
//  Memorize2App.swift
//  Memorize2
//
//  Created by user249939 on 15/1/2024.
//

import SwiftUI

@main
struct Memorize2App: App {
    @StateObject var game = EmojiMenoreyGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
