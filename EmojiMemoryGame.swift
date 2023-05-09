//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Everton Levi on 19/04/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🎚️", "🪄", "🔒", "💿"
                         , "🇹🇲", "🏮", "🔕",
                         "📙", "〽️", "👁️‍🗨️", "⬛️",
                         "⛑️", "🧤", "🧶", "🍸"
                         , "🩲", "🇹🇳", "👱🏻‍♀️",
                         "🖇️", "👤", "👨🏽‍✈️"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 7) {
            pairIndex in emojis[pairIndex]
            // abaixo o mesmo que acima
            // pairIndex in EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func chosse(_ card: Card) {
        model.chosse(card)
    }
}
