
import Foundation

class Trinity: Robot {
    
    var isRight : Bool = true

  
  override func run() {
    

    if position().x > arenaDimensions().width/2
    {
        isRight = true
    }
    else
    {
        isRight = false
    }
    
    
    
    
    let middleHeightOfArena = arenaDimensions().height / 2
    let accuracy: CGFloat = 10
    var currentRobotHeight = position().y
    
    // MOVE TO MIDDLE ON START
    moveToMiddle(middleHeightOfArena, accuracy: accuracy, currentRobotHeight: currentRobotHeight)
    let middleWidthOfArena = arenaDimensions().width
    let sideOfRobot = position().x
    
    // LOOP AFTER REACHING MIDDLE
    while true {
        moveAhead(Int(middleWidthOfArena - 90))
        turnRobotRight(Int(abs(angleBetweenHeadingDirectionAndWorldPosition(CGPoint(x: middleWidthOfArena, y: middleHeightOfArena)))))
        moveAhead(Int(middleWidthOfArena - 90))
        turnRobotLeft(Int(abs(angleBetweenHeadingDirectionAndWorldPosition(CGPoint(x: middleWidthOfArena, y: middleHeightOfArena)))))
//        turnAroundRobot()
        if position().y < middleHeightOfArena - 10 || position().y > middleHeightOfArena + 10{
            moveToMiddle(middleHeightOfArena, accuracy: accuracy, currentRobotHeight: position().y)
        }      }
  }
  
  func moveToMiddle(middleOfArena: CGFloat, accuracy: CGFloat, currentRobotHeight: CGFloat ) {
    var currentRobotHeight = currentRobotHeight
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
    else if currentRobotHeight < (middleOfArena - accuracy) {
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

  }
    
//    func turnAroundRobot()
//    {
//        if isRight == false
//        {
//        let Wall = CGPoint(x: 0, y: Int(arenaDimensions().height/2))
//        let myAngle = angleBetweenHeadingDirectionAndWorldPosition(Wall)
//        turnRobotLeft(abs(Int(myAngle)))
//        let distanceNeeded = position().x
//        moveAhead(abs(Int(distanceNeeded - 90)))
//        }
//        else if isRight == true
//        {
//            
//            
//        let Wall = CGPoint(x: arenaDimensions().width, y: arenaDimensions().height/2)
//        let myAngle = angleBetweenHeadingDirectionAndWorldPosition(Wall)
//        turnRobotLeft(abs(Int(myAngle)))
//        let distanceNeeded = arenaDimensions().width - position().x
//        moveAhead(abs(Int(distanceNeeded - 90)))
//            
//        }
//
//    }
  
  override func scannedRobot(robot: Robot!, atPosition position: CGPoint) {
    
    println("position = \(position)")
    cancelActiveAction()
    let angleToEnemy = angleBetweenGunHeadingDirectionAndWorldPosition(position)
    if angleToEnemy < 0 {
      turnGunLeft(abs(Int(angleToEnemy)))
    } else {
      turnGunRight(Int(angleToEnemy))
    }
    shoot()
  }
  
  override func gotHit() {
    // Add stuff here
  }
  
   
}