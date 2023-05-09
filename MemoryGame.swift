//
//  MemoryGame.swift
//  Memorize
//
//  Created by Everton Levi on 18/04/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceupCard: Int? {
        get { cards.indices.filter({cards[$0].isFaceUp}).oneAndOnly }
        set {
            cards.indices.forEach {cards[$0].isFaceUp = ($0 == newValue)}
        }
    }
    
    mutating func chosse(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {
            // aCardInTheCardsArray in aCardInTheCardsArray.id == card.id
            $0.id == card.id
        }), !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potencialMatchIndex = indexOfTheOneAndOnlyFaceupCard {
                if cards[chosenIndex].content == cards[potencialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potencialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
                
            } else {
                indexOfTheOneAndOnlyFaceupCard = chosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
