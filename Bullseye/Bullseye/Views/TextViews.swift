//
//  TextViews.swift
//  Bullseye
//
//  Created by Sofia Wong on 2/23/24.
//

import SwiftUI

struct InstructionText: View {
  let text: String
  
  var body: some View {
    Text(self.text.uppercased())
      .bold()
      .multilineTextAlignment(.center)
      .font(.footnote)
      .kerning(2.0)
  }
}

struct BigNumberText: View {
  let text: String
  
  var body: some View {
    Text(text)
      .bold()
      .font(.largeTitle)
      .kerning(-1.0)
      .fontWeight(.black)
  }
}

struct ButtonText: View {
  let text: String
  
  var body: some View {
    Text(text)
      .padding(10)
      .frame(maxWidth: .infinity)
      .font(.headline)
      .kerning(-1.0)
      .fontWeight(.medium)
      .background(Color.accentColor)
      .foregroundColor(Color.white)
  }
}




struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack{
      InstructionText(text: "🎯🎯🎯Put the cullseye as close as you can to")
      BigNumberText(text: "34")
      ButtonText(text: "Start New Round")
      
    }
    .padding()
  }
}
