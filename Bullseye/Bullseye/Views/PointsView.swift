//
//  PointsView.swift
//  Bullseye
//
//  Created by Sofia Wong on 2/23/24.
//

import SwiftUI


struct PointsView: View {
  @Binding var game: Game
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  
  var body: some View {
    VStack{
      let roundedValue  = Int(sliderValue)
      InstructionText(text: "The Sliders Value iS:")
      BigNumberText(text: String(roundedValue))
      InstructionText(text: "You scored \(game.points(sliderValue: roundedValue)) points")
      
      Button {
        withAnimation{
          alertIsVisible = false
        }
        
        game.startNewRound(pointsGained: game.points(sliderValue: roundedValue))
      } label: {
        ButtonText(text: "Start New Round")
      }
      .cornerRadius(10)
    }
    .padding()
    .frame(maxWidth: 300)
    .background(Color("BackgroundColor"))
    .cornerRadius(21)
    .shadow(radius: 10)
  
  }
}

struct PointsView_Previews: PreviewProvider {
  static var previews: some View {
    PointsView(game: .constant(Game()), alertIsVisible: .constant(true), sliderValue: .constant(10))
  }
}
