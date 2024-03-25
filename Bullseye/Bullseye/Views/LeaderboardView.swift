//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Sofia Wong on 2/24/24.
//

import SwiftUI

struct LeaderboardView: View {
  @Binding var leaderboardIsShowing: Bool
  @Binding var game: Game
  //var leaderboardEntries: [LeaderboardEntry]
  
  var body: some View {
    ZStack{
      Color.mint.ignoresSafeArea()
      VStack{
        HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
        LabelView()
        ScrollView{
          ForEach(game.leaderboardEntries.indices, id: \.self) { index in let leaderboardEntry = game.leaderboardEntries[index]
            RowView(round: index + 1, score: leaderboardEntry.score, date: leaderboardEntry.date)
          }
        }
        
      }
    }
  }
}

struct RoundTextView: View {
  let round: Int
  var body: some View{
    Text(String(round))
      .bold()
  }
}

struct ScoreText: View{
  let score: Int
  var body: some View{
    Text(String(score))
      .bold()
  }
}

struct DateText: View{
  let date: Date
  //let text: String
  var body: some View {
    Text(date, style: .time)
  }
}

struct HeaderView: View{
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  @Binding var leaderboardIsShowing: Bool
  
  var body: some View{
      ZStack {
        HStack{
          BigBoldText(text: "Leaderboard")
          if verticalSizeClass == .regular && horizontalSizeClass == .compact{
            Spacer()
          }
        }
        HStack {
          Spacer()
          Button{
            leaderboardIsShowing = false
          } label: {
            RoundImageViewFilled(systemName: "xmark")
          }
          
        }
      }.padding([.horizontal, .top])
      
  }
}

struct LabelView: View {
  var body: some View {
    HStack{
      Spacer()
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      Text("Score")
        .frame(width: Constants.Leaderboard.scoreColumnWidth)
      Spacer()
      Text("Date")
        .frame(width: Constants.Leaderboard.dateColumnWidth)
      
    }
    .padding(.horizontal)
    .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
  }
}

struct RowView: View{
  let round: Int
  let score: Int
  let date: Date
  
  var body: some View {
    HStack{
      RoundTextView(round: round)
        .padding()
        .overlay(Circle().strokeBorder(lineWidth: Constants.General.strokeWidth - 1))
      Spacer()
      ScoreText(score: score)
      Spacer()
      DateText(date: date)
    }
    .padding()
    .overlay(RoundedRectangle(cornerRadius: .infinity )
      .stroke(lineWidth: Constants.General.strokeWidth))
    .background(Color.yellow)
    .cornerRadius(.infinity)
    
  }
}

struct BigBoldText: View {
  let text: String
  var body: some View {
    Text(text.uppercased())
      .kerning(2.0)
      .foregroundColor(Color("TextColor"))
      .font(.title)
      .fontWeight(.black)
  }
}
  
  
struct LeaderboardView_Previews: PreviewProvider {
  static var previews: some View {
    var game = Binding.constant(Game(loadTestData: true))
    VStack{
      LeaderboardView(leaderboardIsShowing: .constant(true), game: game)
      
    }
  }
}
