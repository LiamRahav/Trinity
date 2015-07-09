//
//  SimpleRobotSwift.swift
//  RobotWar
//
//  Created by Dion Larson on 7/2/15.
//  Copyright (c) 2015 MakeGamesWithUs. All rights reserved.
//

import Foundation

class TestVot: Robot {
    var i = 0
    
    override func run() {
        while true {
            
            for i;  i < 1; i++
                {    turnRobotRight(90)
                     moveAhead(100) }
            
        }
    }
    
    override func scannedRobot(robot: Robot!, atPosition position: CGPoint) {
        // unimplemented
    }
    
    
    
    override func bulletHitEnemy(bullet: Bullet!) {
        // unimplemented
    }
    
}