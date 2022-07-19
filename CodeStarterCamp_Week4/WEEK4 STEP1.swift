//
//  WEEK4 STEP1.swift
//  CodeStarterCamp_Week4
//
//  Created by oh namjun on 2022/07/19.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

class BodyCondition {
    var upperBodyStrengh: Int = 0
    var lowerBodyStrengh: Int = 0
    var muscularEndurance: Int = 0
    var fatigue: Int = 0
    
    func moveSitUp() {
        let plusupperBodyStrengh = Int.random(in: 10...20)
        let plusfatigue = Int.random(in: 10...20)
        
        self.upperBodyStrengh += plusupperBodyStrengh
        self.fatigue += plusfatigue
        
        print("<<윗몸일으키기을(를) 시작합니다>>")
        print("상체근력이 \(plusupperBodyStrengh) 상승합니다.")
        print("피로도가 \(plusfatigue) 상승합니다.")
        
        checkCondition()
    }
    
    func moveSquat() {
        let pluslowerBodyStrengh = Int.random(in: 10...20)
        let plusfatigue = Int.random(in: 10...20)
        
        self.lowerBodyStrengh += pluslowerBodyStrengh
        self.fatigue += plusfatigue
        
        print("<<스쿼트을(를) 시작합니다>>")
        print("하체근력이 \(pluslowerBodyStrengh) 상승합니다.")
        print("피로도가 \(plusfatigue) 상승합니다.")
        
        checkCondition()
    }

    func moveLongRun() {
        let plusupperBodyStrengh = Int.random(in: 5...10)
        let pluslowerBodyStrengh = Int.random(in: 5...10)
        let plusmuscularEndurance = Int.random(in: 20...30)
        let plusfatigue = Int.random(in: 20...30)
        
        self.upperBodyStrengh += plusupperBodyStrengh
        self.lowerBodyStrengh += pluslowerBodyStrengh
        self.muscularEndurance += plusmuscularEndurance
        self.fatigue += plusfatigue
        
        print("<<오래달리기을(를) 시작합니다>>")
        print("상체근력이 \(plusupperBodyStrengh) 상승합니다.")
        print("하체근력이 \(pluslowerBodyStrengh) 상승합니다.")
        print("근지구력이 \(plusmuscularEndurance) 상승합니다.")
        print("피로도가 \(plusfatigue) 상승합니다.")
        
        checkCondition()
    }

    func moveRest() {
        let plusfatigue = -Int.random(in: 5...10)
        
        self.fatigue += plusfatigue
        
        print("<<휴식을(를) 시작합니다>>")
        print("피로도가 \(plusfatigue) 상승합니다.")
        
        checkCondition()
    }

    func checkCondition() {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyStrengh)")
        print("하체근력: \(lowerBodyStrengh)")
        print("근지구력: \(muscularEndurance)")
        print("피로도: \(fatigue)")
        print("--------------")
    }
}

func moveExercise(_ activity: Activity) {
    activity.action(BodyConditionw)
}
