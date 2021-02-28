//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Martín García on 27/02/2021.
//  Copyright © 2021 Martín García. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    private var game: MemoryGame<String> = createGame()
    
    static func createGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷"]
        return MemoryGame<String>(pairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    // MARK: Intents
    
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
}
