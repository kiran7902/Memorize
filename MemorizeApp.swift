//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Kiran Chandrasekaran on 4/30/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    //game is a pointer to EmojiMemoryGame
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
