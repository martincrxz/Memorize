//
//  EmojiGameView.swift
//  Memorize
//
//  Created by Martín García on 21/02/2021.
//  Copyright © 2021 Martín García. All rights reserved.
//

import SwiftUI

struct EmojiGameView: View {
    @ObservedObject var emojiGame: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(emojiGame.cards) { card in
                CardView(card: card).onTapGesture {
                    self.emojiGame.choose(card: card)
                }
                    .aspectRatio(0.75, contentMode: .fit)
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(emojiGame.cards.count > 4 ? Font.title : Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if !card.faceUp {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.orange)
            }
            else {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3.0)
                Text(card.content)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiGameView(emojiGame: EmojiMemoryGame())
    }
}
