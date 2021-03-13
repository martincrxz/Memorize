//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Martín García on 27/02/2021.
//  Copyright © 2021 Martín García. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame : ObservableObject {
    
    private static let themes = [
        EmojiTheme(emojis: ["👻", "🎃", "🕷", "💀", "🔪"], title: "Halloween", color: Color.orange),
        EmojiTheme(emojis: ["🇦🇷","🥟", "🐄", "⚽️"], title: "Argentina", color: Color.blue)
    ]
    
    private static func createGame(theme: EmojiTheme) -> MemoryGame<String> {
        let gamePairs = Int.random(in: 2...theme.count)
        return MemoryGame<String>(pairsOfCards: gamePairs) { pairIndex in
            return theme.emojis[pairIndex]
        }
    }
    
    @Published
    private var game: MemoryGame<String>
    
    private var theme = themes.randomElement()!
    
    init() {
        game = EmojiMemoryGame.createGame(theme: self.theme)
    }
        
    // MARK: Access
    
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    var title: String {
        theme.title
    }
    
    var color: Color {
        theme.color
    }
    
    var score: Int {
        game.score
    }
    
    // MARK: Intents
    
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
    
    func restart() {
        theme = EmojiMemoryGame.themes.randomElement()!
        game = EmojiMemoryGame.createGame(theme: theme);
    }
}

struct EmojiTheme {
    
    let emojis: [String]
    
    let title: String
    
    let color: Color
    
    let count: Int
    
    init(emojis: [String], title: String, color: Color) {
        self.emojis = emojis.shuffled()
        self.title = title
        self.color = color
        self.count = self.emojis.count
    }
    
}
