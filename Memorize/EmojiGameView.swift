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
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(size: geometry.size)
        }
    }
    
    func body(size: CGSize) -> some View {
        ZStack {
            if !self.card.faceUp {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.orange)
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
