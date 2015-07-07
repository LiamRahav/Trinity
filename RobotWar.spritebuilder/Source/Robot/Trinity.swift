
import Foundation

class Trinity: Robot {
    var lastKnownEnemyPosition = CGPoint(x: 0, y: 0)

    var lastKnownEnemyTimestamp = CGFloat(0.0)
    var enemyPositions = [CGFloat: CGFloat]()
    var isCorrect = false
    
    var state = State.Searching
  
    enum State {
      case Searching, Detected, Firing, Chasing
    }
    
    
  
  override func run() {
    // MOVE TO MIDDLE ON START

    let middleOfArena = arenaDimensions().height / 2
    var currentRobotHeight = position().y
    let accuracy: CGFloat = 10
    
    // Runs if robot starts above the middle
    if currentRobotHeight > (middleOfArena + accuracy) {
      // Turn Trinity so it faces straight down
      turnGunLeft(45)
      turnRobotLeft(90)
      // Nudge Trinity forward 5 pixels until he reaches the accuracy area
      while currentRobotHeight > (middleOfArena + accuracy) {
        moveAhead(5)
        currentRobotHeight = position().y
      }
      // Turn Trinity back so it faces the middle
      turnGunRight(45)
      turnRobotRight(90)
    }
    
    // Runs if robot start below the middle
    if currentRobotHeight < (middleOfArena - accuracy) {
      // Turn Trinity so it faces straight up
      turnGunRight(45)
      turnRobotRight(90)
      // Nudge Trinity forward 5 pixels until he reaches the accuracy area
      while currentRobotHeight < (middleOfArena - accuracy) {
        moveAhead(5)
        currentRobotHeight = position().y
      }
      // Turn Trinity back so it faces the middle
      turnGunLeft(45)
      turnRobotLeft(90)
    }
    
    let x = 5
    let middleWidthOfArena = arenaDimensions().width
    let sideOfRobot = position().x
    
    // LOOP AFTER REACHING MIDDLE
    while true {
        moveAhead(Int(middleWidthOfArena - 90))
        turnRobotRight(180)
        moveAhead(Int(middleWidthOfArena - 90))
        turnRobotLeft(180)
        }
  }
  
}