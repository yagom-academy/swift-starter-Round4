//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BodyCondition {
    var upperStrength: Int = 0
    var lowerStrength: Int = 0
    var muscularEndurance: Int = 0
    var fatigability: Int = 0
}

class Routine {
    let routineName: String
    let routineArray: [Exercise]
    
    init(routineName: String, routineArray: [Exercise]) {
        self.routineName = routineName
        self.routineArray = routineArray
    }
}

//운동 타입
struct Exercise {
    let name: String
    let action: (BodyCondition) -> Void
}

//예시 운동
let sitUp: Exercise = Exercise(name: "sitUp",
        action: { (bodyCondition: BodyCondition) in
            bodyCondition.upperStrength += Int.random(in: 10...20)
            bodyCondition.fatigability += Int.random(in: 10...20)
})

let squat: Exercise = Exercise(name: "squat",
        action: { (bodyCondition: BodyCondition) in
            bodyCondition.lowerStrength += Int.random(in: 20...30)
            bodyCondition.fatigability += Int.random(in: 10...20)
})


let longRunning: Exercise = Exercise(name: "longRunning",
        action: { (bodyCondition: BodyCondition) in
            bodyCondition.muscularEndurance += Int.random(in: 20...30)
            bodyCondition.upperStrength += Int.random(in: 5...10)
            bodyCondition.lowerStrength += Int.random(in: 5...10)
            bodyCondition.fatigability += Int.random(in: 20...30)
})


let dynamicBreak: Exercise = Exercise(name: "dynamicBreak",
        action: { (bodyCondition: BodyCondition) in
            bodyCondition.fatigability -= Int.random(in: 5...10)
    
            if bodyCondition.fatigability < 0 {
                bodyCondition.fatigability = 0
            }
})



let rime: BodyCondition = BodyCondition()
let routineArray: [Exercise] = [sitUp, squat, squat, squat, squat, dynamicBreak, longRunning, longRunning, longRunning, dynamicBreak, dynamicBreak, dynamicBreak, dynamicBreak, dynamicBreak, dynamicBreak]
let helloRoutine: Routine = Routine(routineName: "vulkUp", routineArray: routineArray)

print("------------")
print("\(helloRoutine.routineName)을 시작합니다.")
for exercise in helloRoutine.routineArray {
    print(exercise.name)
    exercise.action(rime)
}
print("-------------")
print("현재의 컨디션은 다음과 같습니다.")
print("상체근력 : \(rime.upperStrength)")
print("하체근력 : \(rime.lowerStrength)")
print("근지구력 : \(rime.muscularEndurance)")
print("피로도 : \(rime.fatigability)")
