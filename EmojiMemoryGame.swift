//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Kiran Chandrasekaran on 5/6/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["✈️", "🚂", "🚀", "🚘", "🚙", "🚌", "🚐", "🚛", "🚑", "🚍", "🚜", "🛴", "🚊", "🚲", "🚕", "🚔", "🚁", "🛺", "🚎", "🛳️", "🚖", "🚃", "🏍️", "⛵️"]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    
    //allow UI to acccess and read cards but not change them
    //swift can detect changes in structs, publish when changes occur
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    
}
