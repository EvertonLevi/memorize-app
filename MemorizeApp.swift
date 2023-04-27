//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Everton Levi on 12/04/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
