//
//  ContentView.swift
//  Memorize
//
//  Created by Kiran Chandrasekaran on 4/30/23.
//

import SwiftUI

struct ContentView: View {
    //when something changes, rebuild the view
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        VStack {
            Spacer()
            //Memorize Title in Game
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
        }
        .padding(.horizontal)
    }
}



struct CardView: View {
    //only pass  minimum needed amount to a view (ex: one card, not all)
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape =  RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            }
            else {
                shape.fill()
            }
        }
    }
}
















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
