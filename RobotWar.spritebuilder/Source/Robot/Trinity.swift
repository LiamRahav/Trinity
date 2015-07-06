
import Foundation

class Trinity: Robot {
  
  var lastKnownEnemyPosition = CGPoint(x: 0, y: 0)
  var lastKnownEnemyTimestamp = CGFloat(0.0)
  var enemyPositions = [CGFloat: CGFloat]()
  var state = State.Searching
  
  enum State {
    case Searching, Detected, Firing, Chasing
  }
  
  override func run() {
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
      println("\nAVERAGE VECTOR: \(averageVector)\n")
    
    println("\nXAver \(xAverage) \n")
    println("\nYAver \(yAverage) \n)")
    println("\n lastKnown X: \(lastKnownEnemyPosition.x) \n")
    

      }
  
  override func scannedRobot(robot: Robot!, atPosition position: CGPoint) {
    enemyPositions[position.x] = position.y

    lastKnownEnemyPosition = position
    
    turnRobotLeft(abs(Int(angleBetweenGunHeadingDirectionAndWorldPosition(position))))
    turnGunLeft(abs(Int(angleBetweenGunHeadingDirectionAndWorldPosition(position))))
  }
  
  override func hitWall(hitDirection: RobotWallHitDirection, hitAngle: CGFloat) {
    turnRobotLeft(Int(abs(hitAngle)))
    turnGunLeft(Int(abs(hitAngle))/2)
  }
}