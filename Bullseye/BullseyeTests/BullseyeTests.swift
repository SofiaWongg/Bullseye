//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Sofia Wong on 2/23/24.
//

import XCTest
@testable import Bullseye


final class BullseyeTests: XCTestCase {
  var game: Game!
  
  override func setUpWithError() throws {
    game = Game()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    game = nil
  }
  
  func testScorePositive() {
    let guess = game.target + 5
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  func testScoreNegative() {
    let guess = game.target - 5
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  func testNewRound(){
    game.startNewRound(pointsGained: 100)
    XCTAssertEqual(game.totalScore, 100)
    XCTAssertEqual(game.round, 2)
  }
  
  func testTargetBonus(){
    game.target = 90
    let gained = game.points(sliderValue: 90)
    XCTAssertEqual(gained, 200)
  }
  
  func testCloseTargetBonus(){
    let gained = game.points(sliderValue: game.target + 2)
    XCTAssertEqual(gained, 98+50)
  }
  
  func testRefresh(){
    game.startNewRound(pointsGained: 78)
    XCTAssertNotEqual(game.totalScore, 0)
    XCTAssertNotEqual(game.round, 1)
    game.refresh()
    XCTAssertEqual(game.totalScore, 0)
    XCTAssertEqual(game.round, 1)
  }
  
  func testLeaderboard() {
    game.startNewRound(pointsGained: 100)
    XCTAssertEqual(game.leaderboardEntries.count, 1)
    XCTAssertEqual(game.leaderboardEntries[0].score, 100)
    game.startNewRound(pointsGained: 200)
    XCTAssertEqual(game.leaderboardEntries.count, 2)
    XCTAssertEqual(game.leaderboardEntries[0].score, 200)
    XCTAssertEqual(game.leaderboardEntries[1].score, 100)
  }
}


