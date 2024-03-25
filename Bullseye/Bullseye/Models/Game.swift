//
//  Game.swift
//  Bullseye
//
//  Created by Sofia Wong on 2/23/24.
//

import Foundation

struct Game {
  var target: Int = Int.random(in: 0...100)
  var totalScore: Int = 0
  var round: Int = 1
  var leaderboardEntries: [LeaderboardEntry] = []
  
  init(loadTestData: Bool = false) {
    if loadTestData {
      addtToLeaderboard(score: 100)
      addtToLeaderboard(score: 80)
      addtToLeaderboard(score: 200)
      addtToLeaderboard(score: 50)
      addtToLeaderboard(score: 20)
    }
  }
  
  func points(sliderValue: Int) -> Int {
    let diff: Int = abs(target - sliderValue)
    var awardedPoints = 100 - diff
    if awardedPoints == 100{
      awardedPoints += 100
    }
    else if awardedPoints >= 98{
      awardedPoints += 50
    }
    
    return awardedPoints
  }
  
  mutating func startNewRound(pointsGained: Int){
    addtToLeaderboard(score: pointsGained)
    totalScore += pointsGained
    round += 1
    target = Int.random(in: 0...100)
   
  }
  
  mutating func refresh(){
    totalScore = 0
    round = 1
    target = Int.random(in: 0...100)
    leaderboardEntries = []
  }
  
  mutating func addtToLeaderboard(score: Int){
    leaderboardEntries.append(LeaderboardEntry(score: score, date: Date()))
    leaderboardEntries.sort { score1, score2 in
      score1.score > score2.score
    }
  }
  
  func getScores () -> [LeaderboardEntry]{
    return leaderboardEntries
  }
}

struct LeaderboardEntry {
  let score : Int
  let date: Date
}
