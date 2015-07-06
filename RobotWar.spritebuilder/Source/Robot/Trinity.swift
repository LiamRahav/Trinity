
import Foundation

class Trinity: Robot {
  
  override func run() {
    while true {
      moveAhead(100)
      turnRobotLeft(10)
    }
  }
  
  override func hitWall(hitDirection: RobotWallHitDirection, hitAngle: CGFloat) {
    turnRobotLeft(Int(abs(hitAngle)))
    turnGunLeft(Int(abs(hitAngle))/2)
  }
}