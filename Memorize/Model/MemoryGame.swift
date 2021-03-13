//
//  MemoryGame.swift
//  Memorize
//
//  Created by Martín García on 27/02/2021.
//  Copyright © 2021 Martín García. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    private(set) var score: Int = 0
    
    init(pairsOfCards: Int, contentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<pairsOfCards {
            let content = contentFactory(pairIndex)
            cards.append(Card(id: 2 * pairIndex, content: content))
            cards.append(Card(id: 2 * pairIndex + 1, content: content))
        }
        cards.shuffle()
    }
    
    private var previouslySelectedCardIndex: Int? {
        get { cards.indices.filter { cards[$0].faceUp }.only }
        set {
            for index in cards.indices {
                cards[index].faceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].faceUp, !cards[chosenIndex].matched {
            if let potentialMatchIndex = previouslySelectedCardIndex {
                if cards[potentialMatchIndex].content == cards[chosenIndex].content {
                    cards[chosenIndex].matched = true
                    cards[potentialMatchIndex].matched = true
                    score += 2
                } else {
                    if cards[potentialMatchIndex].seen {
                        score -= 1
                    }
                    if cards[chosenIndex].seen {
                        score -= 1
                    }
                    cards[potentialMatchIndex].seen = true
                    cards[chosenIndex].seen = true
                }
                cards[chosenIndex].faceUp = !cards[chosenIndex].faceUp
            } else {
                previouslySelectedCardIndex = chosenIndex
            }
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var faceUp: Bool = false
        var matched: Bool = false
        var seen: Bool = false
        var content: CardContent
    }
    
}
