//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscleEndurance: Int
    var tiredness = 0
    
    init() {
        upperBodyStrength = 30
        lowerBodyStrength = 30
        muscleEndurance = 10
    }
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscleEndurance: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscleEndurance = muscleEndurance
    }
}

struct Exercise {
    let name: String
    let action: (BodyCondition) -> BodyCondition
}

let pushUp = Exercise(name: "팔굽혀펴기") { (bodyCondition: BodyCondition) in
    var temporaryBodyCondition = bodyCondition
    temporaryBodyCondition.upperBodyStrength += Int.random(in: 5...15)
    temporaryBodyCondition.tiredness += Int.random(in: 5...10)
    return temporaryBodyCondition
}

let chinUp = Exercise(name: "턱걸이") { (bodyCondition: BodyCondition) in
    var temporaryBodyCondition = bodyCondition
    temporaryBodyCondition.upperBodyStrength += Int.random(in: 15...20)
    temporaryBodyCondition.tiredness += Int.random(in: 10...15)
    return temporaryBodyCondition
}

let dip = Exercise(name: "딥스") { (bodyCondition: BodyCondition) in
    var temporaryBodyCondition = bodyCondition
    temporaryBodyCondition.upperBodyStrength += Int.random(in: 8...14)
    temporaryBodyCondition.tiredness += Int.random(in: 5...10)
    return temporaryBodyCondition
}

let sitUp = Exercise(name: "윗몸일으키기") { (bodyCondition: BodyCondition) in
    var temporaryBodyCondition = bodyCondition
    temporaryBodyCondition.upperBodyStrength += Int.random(in: 10...20)
    temporaryBodyCondition.tiredness += Int.random(in: 10...20)
    return temporaryBodyCondition
}

let squatting = Exercise(name: "스쿼트") { (bodyCondition: BodyCondition) in
    var temporaryBodyCondition = bodyCondition
    temporaryBodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    temporaryBodyCondition.tiredness += Int.random(in: 10...20)
    return temporaryBodyCondition
}

let lunge = Exercise(name: "런지") { (bodyCondition: BodyCondition) in
    var temporaryBodyCondition = bodyCondition
    temporaryBodyCondition.lowerBodyStrength += Int.random(in: 15...20)
    temporaryBodyCondition.tiredness += Int.random(in: 7...10)
    return temporaryBodyCondition
}

let longRun = Exercise(name: "오래달리기") { (bodyCondition: BodyCondition) in
    var temporaryBodyCondition = bodyCondition
    temporaryBodyCondition.muscleEndurance += Int.random(in: 10...20)
    temporaryBodyCondition.upperBodyStrength += Int.random(in: 5...10)
    temporaryBodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    temporaryBodyCondition.tiredness += Int.random(in: 10...20)
    return temporaryBodyCondition
}

let activeRest = Exercise(name: "동적휴식") { (bodyCondition: BodyCondition) in
    var temporaryBodyCondition = bodyCondition
    temporaryBodyCondition.tiredness -= Int.random(in: 5...10)
    if temporaryBodyCondition.tiredness < 0 {
        temporaryBodyCondition.tiredness = 0
    }
    return temporaryBodyCondition
}
