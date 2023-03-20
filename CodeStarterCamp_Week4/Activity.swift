//
//  Step1.swift
//  CodeStarterCamp_Week4
//
//  Created by Whales on 2023/03/20.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let sitUp: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    print("<<\(sitUp.name)을(를) 시작합니다>>")
    bodyCondition.upperBodyMuscleStrength += 13
    bodyCondition.degreeOfFatigue += 18
})
let squat: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    print("<<\(squat.name)을(를) 시작합니다>>")
    bodyCondition.lowerBodyMuscleStrength += 20
    bodyCondition.degreeOfFatigue += 25
})
let marathon: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    print("<<\(marathon.name)을(를) 시작합니다>>")
    bodyCondition.upperBodyMuscleStrength += 7
    bodyCondition.lowerBodyMuscleStrength += 9
    bodyCondition.muscularEndurance += 23
    bodyCondition.degreeOfFatigue += 30
})
let dynamicResting: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    print("<<\(dynamicResting.name)을(를) 시작합니다>>")
    bodyCondition.degreeOfFatigue -= 7
})

