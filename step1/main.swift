//
//  main.swift
//  step1
//
//  Created by codenest on 2022/07/14.
//

import Foundation

struct BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
}
struct Activity {
    let name: String
    let action: (BodyCondition) -> BodyCondition
}

let sitUp: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition -> BodyCondition in
    let randomUpperBodyStrengthGrowth = Int.random(in: 10...20)
    let randomFatigueGrowth = Int.random(in: 10...20)
    print("""
    상체근력이 \(randomUpperBodyStrengthGrowth) 상승합니다.
    피로도가 \(randomFatigueGrowth) 상승합니다.
    """)
    
    var currentUpperBodyStrength = bodyCondition.upperBodyStrength
    var currentFatigue = bodyCondition.fatigue
    currentUpperBodyStrength += randomUpperBodyStrengthGrowth
    currentFatigue += randomFatigueGrowth
    return bodyCondition
})

let squat: Activity = Activity(name: "스쿼트", action: { bodyCondition -> BodyCondition in
    let randomLowerBodyStrengthGrowth = Int.random(in: 20...30)
    let randomFatigueGrowth = Int.random(in: 10...20)
    print("""
    하체근력이 \(randomLowerBodyStrengthGrowth) 상승합니다.
    피로도가 \(randomFatigueGrowth) 상승합니다.
    """)
    
    var currentLowerBodyStrength  = bodyCondition.lowerBodyStrength
    var currentFatigue = bodyCondition.fatigue
    currentLowerBodyStrength += randomLowerBodyStrengthGrowth
    currentFatigue += randomFatigueGrowth
    return bodyCondition
})

let running: Activity = Activity(name: "오래달리기", action: { bodyCondition -> BodyCondition in
    let randomMuscularEnduranceGrowth = Int.random(in: 20...30)
    let randomUpperBodyStrengthGrowth = Int.random(in: 5...10)
    let randomLowerBodyStrengthGrowth = Int.random(in: 5...10)
    let randomFatigueGrowth = Int.random(in: 20...30)
    print("""
    근지구력이 \(randomMuscularEnduranceGrowth) 상승합니다.
    상체근력이 \(randomUpperBodyStrengthGrowth) 상승합니다.
    하체근력이 \(randomLowerBodyStrengthGrowth) 상승합니다.
    피로도가 \(randomFatigueGrowth) 상승합니다.
    """)
    
    var currentMuscularEndurance = bodyCondition.muscularEndurance
    var currentUpperBodyStrength = bodyCondition.upperBodyStrength
    var currentLowerBodyStrength = bodyCondition.lowerBodyStrength
    var currentFatigue = bodyCondition.fatigue
    
    currentMuscularEndurance += randomMuscularEnduranceGrowth
    currentUpperBodyStrength += randomUpperBodyStrengthGrowth
    currentLowerBodyStrength += randomLowerBodyStrengthGrowth
    currentFatigue += randomFatigueGrowth
    return bodyCondition
})

let activeRest: Activity = Activity(name: "동적휴식", action: { bodyCondition -> BodyCondition in
    let randomFatigueReduction = Int.random(in: 5...10)
    print("피로도가 \(randomFatigueReduction) 하락합니다.")
    
    var currentFatigue = bodyCondition.fatigue
    currentFatigue -= randomFatigueReduction
    return bodyCondition
})

func workOut(_ activity: Activity, _ bodyCondition: BodyCondition) {
    print("<<\(activity.name)을(를) 시작합니다>>")
    activity.action(bodyCondition)
    
    print("--------------")
}

func checkBodyCondition(_ name: BodyCondition) {
    print("""
현재의 컨디션은 다음과 같습니다.
상체근력: \(name.upperBodyStrength)
하체근력: \(name.lowerBodyStrength)
근지구력: \(name.muscularEndurance)
피로도: \(name.fatigue)
--------------
""")
}

var codeSparrow: BodyCondition = BodyCondition(upperBodyStrength: 70, lowerBodyStrength: 50, muscularEndurance: 30, fatigue: 0)

workOut(sitUp, codeSparrow)
checkBodyCondition(codeSparrow)
