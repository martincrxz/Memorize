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
        GeometryReader { geometry in
            VStack {
                HStack() {
                    Button("< Back") {
                    
                    }
                        .padding(.leading)
                    Spacer()
                    Button("New Game") {
                        self.emojiGame.restart()
                    }
                        .padding(.trailing)
                }
                    .if(geometry.size.height < geometry.size.width) { $0.padding(.top) }
                    .padding(.bottom)
                HStack() {
                    Text(self.emojiGame.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading)
                    Spacer()
                }
                Grid(self.emojiGame.cards) { card in
                    CardView(card: card, color: self.emojiGame.color).onTapGesture {
                        self.emojiGame.choose(card: card)
                    }
                        .padding()
                        .foregroundColor(self.emojiGame.color)
                }
                HStack() {
                    Text("Score: ")
                    Text(String(self.emojiGame.score))
                }
                    .font(.title)
                    .padding(.bottom)
            }
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
