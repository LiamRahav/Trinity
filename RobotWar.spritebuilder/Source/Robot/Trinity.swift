
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
      switch state {
        case .Searching:
          search()
        case .Detected:
          println("Detected")
        case .Firing:
          println("Firing")
        case .Chasing:
          println("Chasing")
      }
    }
  }
  
  func search() {
//    if enemyPositions != nil {
      var xAverage: CGFloat = 0
      var yAverage: CGFloat = 0
      for (x, y) in enemyPositions {
        xAverage += x
        yAverage += y
      }
      xAverage /= CGFloat(enemyPositions.count)
      yAverage /= CGFloat(enemyPositions.count)
      var enemyNextPositionGuess = CGPoint(x: xAverage, y: yAverage)
     // var averageVector = CGPoint(x:lastKnownEnemyPosition.x - enemyNextPositionGuess.x, y: lastKnownEnemyPosition.y - enemyNextPositionGuess.y)
    var averageVector = CGPoint(x: 6.7 - 7.4, y: 4.2 - 5.0)
    

      }
  
  override func scannedRobot(robot: Robot!, atPosition position: CGPoint) {
    enemyPositions[position.x] = position.y
    
    lastKnownEnemyPosition = position
    let angleToObstacle: Int = Int(angleBetweenHeadingDirectionAndWorldPosition(position))
    
    if angleToObstacle <= 0 {
//      turnRobotLeft(abs(angleToObstacle))
      turnGunLeft(abs(angleToObstacle))
    } else {
//      turnRobotRight(abs(angleToObstacle))
      turnGunRight(abs(angleToObstacle))
    }
    
    
  }
  
//  override func hitWall(hitDirection: RobotWallHitDirection, hitAngle: CGFloat) {
//    if hitAngle >= 0 {
//      turnRobotLeft(Int(abs(hitAngle)))
//    } else {
//      turnRobotRight(Int(abs(hitAngle)))
//    }
//    
//    // leave wall
//    moveAhead(20)
//  }
}

//