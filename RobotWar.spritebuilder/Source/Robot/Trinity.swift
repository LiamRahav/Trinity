
import Foundation

class Trinity: Robot {
  
  var lastKnownEnemyPosition = CGPoint(x: 0, y: 0)
  var lastKnownEnemyTimestamp = CGFloat(0.0)
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
    // If we know where they were, go there
    
    // Else do random movement
  }
  
  override func scannedRobot(robot: Robot!, atPosition position: CGPoint) {
    lastKnownEnemyPosition = position
    
    turnRobotLeft(abs(Int(angleBetweenGunHeadingDirectionAndWorldPosition(position))))
    turnGunLeft(abs(Int(angleBetweenGunHeadingDirectionAndWorldPosition(position))))
    shoot()
  }
  
  override func hitWall(hitDirection: RobotWallHitDirection, hitAngle: CGFloat) {
    turnRobotLeft(Int(abs(hitAngle)))
    turnGunLeft(Int(abs(hitAngle))/2)
  }
}