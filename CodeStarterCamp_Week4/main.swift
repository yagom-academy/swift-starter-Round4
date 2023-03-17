//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var charlesBodyCondition = BodyCondition(upperStrength: 0, lowerStrength: 0, muscularEndurance: 0, fatigability: 0)


let sitUp = Activity(name: "윗몸일으키기") { bodyCondition in
    bodyCondition.upperStrength += Int.random(in: 10 ... 20)
    bodyCondition.fatigability += Int.random(in: 10 ... 20)
    bodyCondition.checkCondition()
}


let squat = Activity(name: "스쿼트") { bodyCondition in
    bodyCondition.lowerStrength += Int.random(in: 20 ... 30)
    bodyCondition.fatigability += Int.random(in: 10 ... 20)
    bodyCondition.checkCondition()
}

let longRun = Activity(name: "오래달리기") { bodyCondition in
    bodyCondition.muscularEndurance += Int.random(in: 20 ... 30)
    bodyCondition.upperStrength += Int.random(in: 5 ... 10)
    bodyCondition.lowerStrength += Int.random(in: 5 ... 10)
    bodyCondition.fatigability += Int.random(in: 20 ... 30)
    bodyCondition.checkCondition()
}

let dynamicRestin = Activity(name: "동적휴식") { bodyCondition in
    bodyCondition.fatigability -= Int.random(in: 5 ... 10)
    bodyCondition.checkCondition()
}


let deadLift = Activity(name: "데드리프트") { bodyCondition in
    bodyCondition.upperStrength += Int.random(in: 10 ... 20)
    bodyCondition.lowerStrength += Int.random(in: 10 ... 20)
    bodyCondition.fatigability += Int.random(in: 10 ... 20)
}

let benchPress = Activity(name: "벤치프레스") { bodyCondition in
    bodyCondition.upperStrength += Int.random(in: 20 ... 30)
    bodyCondition.fatigability += Int.random(in: 20 ... 30)
    bodyCondition.checkCondition()
}




sitUp.doExercise(with: charlesBodyCondition)
