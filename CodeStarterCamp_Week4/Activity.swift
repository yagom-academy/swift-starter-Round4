//
//  Step1.swift
//  CodeStarterCamp_Week4
//
//  Created by 서혜진 on 2023/03/17.
//

import Swift

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let bodyCondition: BodyCondition = BodyCondition(upper: 10, lower: 15, muscular: 20, fatigue: 30)
let sitUp: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    let effect1 = Int.random(in: 10...20)
    let effect2 = Int.random(in: 10...20)
    
    print("""
    <<\(sitUp.name)을(를) 시작합니다>>
    상체근력이 \(effect1) 상승합니다.
    피로도가 \(effect2) 상승합니다.
    """)
    
    bodyCondition.upperBodyMuscleStrength += effect1
    bodyCondition.degreeOfFatigue += effect2
})
let squat: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    let effect1 = Int.random(in: 20...30)
    let effect2 = Int.random(in: 10...20)
    
    print("""
    <<\(squat.name)을(를) 시작합니다>>
    하체근력이 \(effect1) 상승합니다.
    피로도가 \(effect2) 상승합니다.
    """)
    
    bodyCondition.lowerBodyMuscleStrength += effect1
    bodyCondition.degreeOfFatigue += effect2
})
let marathon: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    let effect1 = Int.random(in: 5...10)
    let effect2 = Int.random(in: 5...10)
    let effect3 = Int.random(in: 20...30)
    let effect4 = Int.random(in: 20...30)
    
    print("""
    <<\(marathon.name)을(를) 시작합니다>>
    상체근력이 \(effect1) 상승합니다.
    하체근력이 \(effect2) 상승합니다.
    근지구력이 \(effect3) 상승합니다.
    피로도가 \(effect4) 상승합니다.
    """)
    
    bodyCondition.upperBodyMuscleStrength += effect1
    bodyCondition.lowerBodyMuscleStrength += effect2
    bodyCondition.muscularEndurance += effect3
    bodyCondition.degreeOfFatigue += effect4
})
let dynamicResting: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    let effect = Int.random(in: 5...10)
    
    print("""
    <<\(dynamicResting.name)을(를) 시작합니다>>
    피로도가 \(effect) 하락합니다.
    """)
    
    bodyCondition.degreeOfFatigue -= effect
})
