//
//  bodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by song on 2021/12/29.
//



//  bodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by song on 2021/12/29.
//

import Foundation

class BodyCondition {
    var upperbodystrength :Int
    var lowerbodystrength :Int
    var muscularendurance :Int
    var fatigue :Int
    
    init(upperbodystrength: Int, lowerbodystrength: Int, muscularendurance: Int, fatigue: Int) {
        self.upperbodystrength = upperbodystrength
        self.lowerbodystrength = lowerbodystrength
        self.muscularendurance = muscularendurance
        self.fatigue = fatigue
    }
 
    
    func nowCondition() {
        print("""
            상체근력: \(bodyCondition.upperbodystrength)
            하체근력: \(bodyCondition.lowerbodystrength)
            근지구력: \(bodyCondition.muscularendurance)
            피로도: \(bodyCondition.fatigue)
            """)
    }
}


