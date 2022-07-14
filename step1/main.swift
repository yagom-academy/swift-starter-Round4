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
    let action: (BodyCondition) -> Void
}

let sitUp: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    let randomUpperBodyStrengthGrowth = Int.random(in: 10...20)
    let randomFatigueGrowth = Int.random(in: 10...20)
    print("""
    상체근력이 \(randomUpperBodyStrengthGrowth) 상승합니다.
    피로도가 \(randomFatigueGrowth) 상승합니다.
    """)
    codeSparrow.upperBodyStrength += randomUpperBodyStrengthGrowth
    codeSparrow.fatigue += randomFatigueGrowth
})
let squat: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    let randomLowerBodyStrengthGrowth = Int.random(in: 20...30)
    let randomFatigueGrowth = Int.random(in: 10...20)
    print("""
    하체근력이 \(randomLowerBodyStrengthGrowth) 상승합니다.
    피로도가 \(randomFatigueGrowth) 상승합니다.
    """)
    codeSparrow.lowerBodyStrength += randomLowerBodyStrengthGrowth
    codeSparrow.fatigue += randomFatigueGrowth
})
let running: Activity = Activity(name: "오래달리기", action: { bodyCondition in
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
    codeSparrow.muscularEndurance += randomMuscularEnduranceGrowth
    codeSparrow.upperBodyStrength += randomUpperBodyStrengthGrowth
    codeSparrow.lowerBodyStrength += randomLowerBodyStrengthGrowth
    codeSparrow.fatigue += randomFatigueGrowth
})
let activeRest: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    let randomFatigueReduction = Int.random(in: 5...10)
    print("피로도가 \(randomFatigueReduction) 하락합니다.")
    codeSparrow.fatigue -= randomFatigueReduction
})

func workOut(_ activity: Activity) {
    print("<<\(activity.name)을(를) 시작합니다>>")
    activity.action(codeSparrow)
    print("--------------")
}

var codeSparrow: BodyCondition = BodyCondition(upperBodyStrength: 70, lowerBodyStrength: 50, muscularEndurance: 30, fatigue: 0)
