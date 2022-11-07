//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BodyCondition {
    var upperBodyStrength: Int = 0
    var lowerBodyStrength: Int = 0
    var muscularEndurance: Int = 0
    var fatigueLevel: Int = 0
    
    func informBodyCondition() {
        print("--------------\n현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyStrength)")
        print("하체근력: \(lowerBodyStrength)")
        print("근지구력: \(muscularEndurance)")
        print("피로도: \(fatigueLevel)")
        print("--------------")
    }
}

struct Activity {
    let name: String
    let action: (inout BodyCondition) -> Void
}


let sitUp: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    let upperBodyStrengthFigure = Int.random(in: 10...20)
    let fatigueLevelFigure = Int.random(in: 10...20)
    
    bodyCondition.upperBodyStrength += upperBodyStrengthFigure
    bodyCondition.fatigueLevel += fatigueLevelFigure
    print("상체근력이 \(upperBodyStrengthFigure) 상승합니다.")
    print("피로도가 \(fatigueLevelFigure) 상승합니다.")
})

let squat: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    let lowerBodyStrengthFigure = Int.random(in: 20...30)
    let fatigueLevelFigure = Int.random(in: 10...20)
    
    bodyCondition.lowerBodyStrength += lowerBodyStrengthFigure
    bodyCondition.fatigueLevel += fatigueLevelFigure
    print("하체근력이 \(lowerBodyStrengthFigure) 상승합니다.")
    print("피로도가 \(fatigueLevelFigure) 상승합니다.")
})

let longRunning: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    let muscularEnduranceFigure = Int.random(in: 20...30)
    let bodyStrengthFigure = Int.random(in: 5...10)
    let fatigueLevelFigure = Int.random(in: 20...30)
    
    bodyCondition.muscularEndurance += muscularEnduranceFigure
    bodyCondition.upperBodyStrength += bodyStrengthFigure
    bodyCondition.lowerBodyStrength += bodyStrengthFigure
    bodyCondition.fatigueLevel += fatigueLevelFigure
    print("근지구력이 \(muscularEnduranceFigure) 상승합니다.")
    print("상,하체근력이 \(bodyStrengthFigure) 상승합니다.")
    print("피로도가 \(fatigueLevelFigure) 상승합니다.")
})

let activeRest: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    let fatigueLevelFigure = Int.random(in: 5...10)
    
    bodyCondition.fatigueLevel -= fatigueLevelFigure
    print("피로도가 \(fatigueLevelFigure) 하락합니다.")
})


var myCondition: BodyCondition = BodyCondition()

func workOut(activity: Activity, by bodyCondition: inout BodyCondition) {
    print("<<\(activity.name)을(를) 시작합니다.>>")
    activity.action(&bodyCondition)
}


workOut(activity: sitUp, by: &myCondition)
workOut(activity: squat, by: &myCondition)
workOut(activity: longRunning, by: &myCondition)
workOut(activity: activeRest, by: &myCondition)

myCondition.informBodyCondition()
myCondition.informBodyCondition()
