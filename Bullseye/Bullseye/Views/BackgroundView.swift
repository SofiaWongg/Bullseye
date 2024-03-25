//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Sofia Wong on 2/23/24.
//

import SwiftUI

struct BackgroundView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack{
      TopView(game: $game, entries: game.getScores())
      Spacer()
      BottomView(game: $game)
      
    }
    .padding()
    .background(RingsView())
  }
}

struct BottomView: View {
  @Binding var game: Game
  var body: some View {
    HStack{
      NumberView(title: "Total", text: String(game.totalScore))
      Spacer()
      NumberView(title: "Round", text: String(game.round))
    }
  }
}

struct NumberView: View {
  let title: String
  let text: String
  
  var body: some View {
    VStack{
      Text(title.uppercased())
        .bold()
        .kerning(4)
      Text(text)
        .bold()
        .font(.title3)
        .padding(20)
        .overlay(RoundedRectangle(cornerRadius: 20).strokeBorder(Color.blue))
    }
  }
}

struct RingsView: View {
  
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    ZStack {
      Color("BackgroundColor").ignoresSafeArea()
      ForEach(1..<6) {ring in
        let size = CGFloat(ring * 100)
        let opacity = colorScheme == ColorScheme.dark ? 0.1 : 0.3
        Circle()
          .stroke(lineWidth: 20)
          .fill(RadialGradient(colors: [Color.white.opacity(opacity), Color.teal.opacity(0.15)], center: .center, startRadius: 5, endRadius: 500))
          .frame(width: size, height: size)
      }
    }
  }
}

struct TopView: View {
  @State private var leaderboardIsShowing: Bool = false
  @Binding var game: Game
  var entries: [LeaderboardEntry]
  var body: some View {
    HStack{
      RoundImageViewStroked(systemName: "arrow.counterclockwise").onTapGesture {
        game.refresh()
      }
      Spacer()
      Button{
        leaderboardIsShowing = true
      }label:{
        RoundImageViewStroked(systemName: "list.dash")
      }
      .sheet(isPresented: $leaderboardIsShowing){
        LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
      }    }
  }
}



struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundView(game: .constant(Game())) //use constant
  }
}
