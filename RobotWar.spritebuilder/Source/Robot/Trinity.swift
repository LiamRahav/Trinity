
import Foundation



class Trinity: Robot {
    var lastKnownEnemyPosition = CGPoint(x: 0, y: 0){
        didSet
        {
            
        }
    }
  var lastKnownEnemyTimestamp = CGFloat(0.0)
  var enemyPositions = [CGFloat: CGFloat]()
    var isCorrect = false
    
    var state = State.Searching
  
  enum State {
    case Searching, Detected, Firing, Chasing
  }
    
    
  
  override func run() {
    let ScreenSize = arenaDimensions()
    let correctHeight = ScreenSize.height/2
    
    println(correctHeight)
   while isCorrect == false /* + 10 || position().y != correctHeight - 10 */ {
    
        if position().y < correctHeight {
            // Move up
            
            if position().y > correctHeight {
                turnRobotLeft(90)
                moveAhead(40)
                turnRobotRight(90)
            
            }
            else {
                turnRobotRight(90)
                moveAhead(20)
                turnRobotLeft(90)
            }
            
            if position().y == correctHeight
            {
            break
            }
            
        } else if position().y > correctHeight {
            // Move down
            if position().y < correctHeight {
                turnRobotRight(90)
                moveAhead(40)
                turnRobotLeft(90)
                
            }
            else {
                turnRobotLeft(90)
                moveAhead(20)
                turnRobotRight(90)
            }
            if position().y == correctHeight
            {
                break
            }

       }
    }
    
    
    while true {
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
      turnRobotLeft(abs(angleToObstacle))
      turnGunLeft(abs(angleToObstacle))
    } else {
      turnRobotRight(abs(angleToObstacle))
      turnGunRight(abs(angleToObstacle))
    }
    
   
    
  }
  
  override func hitWall(hitDirection: RobotWallHitDirection, hitAngle: CGFloat) {
    if hitAngle >= 0 {
      turnRobotLeft(Int(abs(hitAngle)))
    } else {
      turnRobotRight(Int(abs(hitAngle)))
    }
    
    // leave wall
    moveAhead(20)
  }
}

