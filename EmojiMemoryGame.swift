//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Everton Levi on 19/04/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🎚️", "🪄", "🔒", "💿"
                         , "🇹🇲", "🏮", "🔕",
                         "📙", "〽️", "👁️‍🗨️", "⬛️",
                         "⛑️", "🧤", "🧶", "🍸"
                         , "🩲", "🇹🇳", "👱🏻‍♀️",
                         "🖇️", "👤", "👨🏽‍✈️"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 3) {
            pairIndex in emojis[pairIndex]
            // abaixo o mesmo que acima
            // pairIndex in EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func chosse(_ card: MemoryGame<String>.Card) {
        model.chosse(card)
    }
}
