//
//  MemoryGame.swift
//  Memorize
//
//  Created by Martín García on 27/02/2021.
//  Copyright © 2021 Martín García. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
    
    init(pairsOfCards: Int, contentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<pairsOfCards {
            let content = contentFactory(pairIndex)
            cards.append(Card(id: 2 * pairIndex, content: content))
            cards.append(Card(id: 2 * pairIndex + 1, content: content))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var id: Int
        var faceUp: Bool = true
        var matched: Bool = false
        var content: CardContent
    }
}
