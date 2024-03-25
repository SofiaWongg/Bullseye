//
//  ContentView.swift
//  Bullseye
//
//  Created by Sofia Wong on 2/23/24.
//

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible: Bool = false
  @State private var sliderValue: Double = 10.0
  @State private var game: Game = Game()
  
  var body: some View {
    ZStack {
      BackgroundView(game: $game)
      VStack {
        InstructionsView(game: $game)
          .padding(alertIsVisible ? 0.0 : 2.0)
        if alertIsVisible {
          PointsView(game: $game, alertIsVisible: $alertIsVisible, sliderValue: $sliderValue).transition(.scale)
        }else{
          HStack{
            Text("0").frame(width: 50)
            Slider(value: $sliderValue, in: 1.0...100.0)
            Text("100").frame(width: 50)
          }.transition(.scale)
          
          Button("Hit Me".uppercased()){
            withAnimation{
              alertIsVisible = true
            }
            
          } // add, action: here
          .foregroundColor(.white)
          .padding(20)
          .background(.blue)
          .cornerRadius(10)
          .bold()
          .font(.title)
          .overlay(RoundedRectangle(cornerRadius: 10)
            .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth))
          
        }
       
//        .alert(
//          "Go home bitch",
//          isPresented: $alertIsVisible,
//          actions: {
//            Button("Shut up"){
//              game.startNewRound(pointsGained: game.points(sliderValue: Int(sliderValue)))
//            }
//          }) {
//            let roundedVal: Int  = Int(sliderValue)
//            Text("""
//            I hate this smmmmm \(roundedVal)
//            You scored \(game.points(sliderValue: roundedVal)))
//            """)
//                      }
      }
    }
    
  }}

struct InstructionsView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack{
      InstructionText(text: "🎯🎯🎯Put the bullseye as close as you can to")
        .padding(.horizontal, 30)
      BigNumberText(text: String(game.target))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
