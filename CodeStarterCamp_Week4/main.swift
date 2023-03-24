//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// Step1
//sitUp.action(dawn)
//dawn.checkBodyCondition()
//squat.action(dawn)
//dawn.checkBodyCondition()
//dynamicBreak.action(dawn)
//dawn.checkBodyCondition()

// Step2
let sitUp: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    print("<<\(sitUp.name)을(를) 시작합니다>>")
    bodyCondition.upperBodyStrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let squat: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    print("<<\(squat.name)을(를) 시작합니다>>")
    bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
})

let longRun: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    print("<<\(longRun.name)을(를) 시작합니다>>")
    bodyCondition.muscularEndurance += Int.random(in: 20...30)
    bodyCondition.upperBodyStrength += Int.random(in: 5...10)
    bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    bodyCondition.fatigue += Int.random(in: 20...30)
})

let dynamicBreak: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    print("<<\(dynamicBreak.name)을(를) 시작합니다>>")
    bodyCondition.fatigue -= Int.random(in: 5...10)
})

let dawn: BodyCondition = BodyCondition(upperBodyStrength: 10, lowerBodyStrength: 10, muscularEndurance: 10, fatigue: 10)
let routine = Routine(name: "hellRoutine", activities: [sitUp, dynamicBreak, squat])
let myProgram = FitnessProgram()

myProgram.executeFitnessProgram(user: dawn, with: routine)
