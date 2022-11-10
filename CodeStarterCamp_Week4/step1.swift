//
//  step1.swift
//  CodeStarterCamp_Week4
//
//  Created by Hyejeong Jeong on 2022/11/09.
//

import Foundation


class BodyCondition {
    var upperBodyStrength: Int {
        didSet {
            print("상체근력이 \(upperBodyStrength - oldValue) 상승합니다.")
        }
    }
    var lowerBodyStrength: Int {
        didSet {
            print("하체근력이 \(lowerBodyStrength - oldValue) 상승합니다.")
        }
    }
    var muscularEndurance: Int {
        didSet {
            print("근지구력이 \(muscularEndurance - oldValue) 상승합니다.")
        }
    }
    var fatigueLevel: Int {
        didSet {
            if oldValue < fatigueLevel {
                print("피로도가 \(fatigueLevel - oldValue) 상승합니다.")
            } else {
                print("피로도가 \(oldValue - fatigueLevel) 하락합니다.")
            }
        }
    }
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigueLevel: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigueLevel = fatigueLevel
    }
    
    func informBodyCondition() {
        print("""
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(upperBodyStrength)
        하체근력: \(lowerBodyStrength)
        근지구력: \(muscularEndurance)
        피로도: \(fatigueLevel)
        --------------
        """)
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}


let sitUp: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    let upperBodyStrengthFigure = Int.random(in: 10...20)
    let fatigueLevelFigure = Int.random(in: 10...20)
    
    bodyCondition.upperBodyStrength += upperBodyStrengthFigure
    bodyCondition.fatigueLevel += fatigueLevelFigure
})

let squat: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    let lowerBodyStrengthFigure = Int.random(in: 20...30)
    let fatigueLevelFigure = Int.random(in: 10...20)
    
    bodyCondition.lowerBodyStrength += lowerBodyStrengthFigure
    bodyCondition.fatigueLevel += fatigueLevelFigure
})

let longRunning: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    let muscularEnduranceFigure = Int.random(in: 20...30)
    let bodyStrengthFigure = Int.random(in: 5...10)
    let fatigueLevelFigure = Int.random(in: 20...30)
    
    bodyCondition.muscularEndurance += muscularEnduranceFigure
    bodyCondition.upperBodyStrength += bodyStrengthFigure
    bodyCondition.lowerBodyStrength += bodyStrengthFigure
    bodyCondition.fatigueLevel += fatigueLevelFigure
})

let activeRest: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    let fatigueLevelFigure = Int.random(in: 5...10)
    
    bodyCondition.fatigueLevel -= fatigueLevelFigure
})


func workOut(activity: Activity, by bodyCondition: BodyCondition) {
    print("<<\(activity.name)을(를) 시작합니다.>>")
    activity.action(bodyCondition)
}
