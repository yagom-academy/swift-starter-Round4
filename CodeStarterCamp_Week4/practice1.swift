//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


class BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    init(upperBodyStrength: Int,
         lowerBodyStrength: Int,
         muscularEndurance: Int,
         fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func sitUp(upperStrength: BodyCondition.upperBodyStrength, fatigue: fatigue) {
        
    }
    func doSquat() {
        
    }
    func doLongDistanceRunning() {
        
    }
    func takeDynamicRest() {
        
    }
}


struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}
