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
        VStack {
            Text("New Game").onTapGesture {
                self.emojiGame.restart()
            }
            Text(emojiGame.title).font(Font.largeTitle)
            Grid(emojiGame.cards) { card in
                CardView(card: card, color: self.emojiGame.color).onTapGesture {
                    self.emojiGame.choose(card: card)
                }
                    .padding()
            }
                .padding()
            .foregroundColor(emojiGame.color)
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var color: Color
    
    var body: some View {
        GeometryReader { geometry in
            self.body(size: geometry.size)
        }
    }
    
    func body(size: CGSize) -> some View {
        ZStack {
            if !self.card.faceUp {
                if !card.matched {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(color)
                }
            }
            else {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: edgeLineWidth)
                Text(self.card.content)
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3.0
    func fontSize(for size:CGSize) -> CGFloat {
        0.75 * min(size.width, size.height)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiGameView(emojiGame: EmojiMemoryGame())
    }
}
