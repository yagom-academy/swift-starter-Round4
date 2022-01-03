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
        print("---------------\n현제의 컨디션은 다음과 같습니다.\n상체근력: \(upperbodystrength)\n하체근력: \(lowerbodystrength)\n근지구력: \(muscularendurance)\n피로도: \(fatigue)")
    }
}
