//
//  step01.swift
//  CodeStarterCamp_Week4
//
//  Created by karen on 2023/03/14.
//

import Foundation

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

class BodyCondition {
    var upperBodyStrength: Int //상체근력
    var lowerBodyMuscleStrength: Int //하체근력
    var muscularEndurance: Int //근지구력
    var degreeOfFatigue: Int //피로도
    
    func printCondition() {
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체 근력 : \(upperBodyStrength)")
        print("하체 근력 : \(lowerBodyMuscleStrength)")
        print("근지구력 : \(muscularEndurance)")
        print("피로도 : \(degreeOfFatigue)")
    }
    
    init(upperBodyStrength: Int, lowerBodyMuscleStrength: Int, muscularEndurance: Int, degreeOfFatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyMuscleStrength = lowerBodyMuscleStrength
        self.muscularEndurance = muscularEndurance
        self.degreeOfFatigue = degreeOfFatigue
    }
    
}

let sitUp: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    print("<<윗몸일으키기을(를) 시작합니다.>>")
    bodyCondition.upperBodyStrength += Int.random(in:10...20)
    bodyCondition.degreeOfFatigue += Int.random(in:10...20)
    print("상체근력이 \(bodyCondition.upperBodyStrength) 상승합니다.")
    print("피로도가 \(bodyCondition.degreeOfFatigue) 상승합니다.")
    bodyCondition.printCondition()
})

let squats: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    print("<<스쿼트을(를) 시작합니다.>>")
    bodyCondition.lowerBodyMuscleStrength += Int.random(in:20...30)
    bodyCondition.degreeOfFatigue += Int.random(in:10...20)
    print("하체근력이 \(bodyCondition.lowerBodyMuscleStrength) 상승합니다.")
    print("피로도가 \(bodyCondition.degreeOfFatigue) 상승합니다.")
    bodyCondition.printCondition()
})

let longRun: Activity = Activity(name: "오래달리기", action: { bodyCondition in
    print("<<오래달리기을(를) 시작합니다.>>")
    bodyCondition.muscularEndurance += Int.random(in:20...30)
    bodyCondition.upperBodyStrength += Int.random(in:5...10)
    bodyCondition.lowerBodyMuscleStrength += Int.random(in:5...10)
    bodyCondition.degreeOfFatigue += Int.random(in:10...20)
    print("근지구력이 \(bodyCondition.muscularEndurance) 상승합니다.")
    print("상체근력이 \(bodyCondition.upperBodyStrength) 상승합니다.")
    print("하체근력이 \(bodyCondition.lowerBodyMuscleStrength) 상승합니다.")
    print("피로도가 \(bodyCondition.degreeOfFatigue) 상승합니다.")
})

let dynamicResting: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    print("<<동적휴식을(를) 시작합니다.>>")
    bodyCondition.degreeOfFatigue -= Int.random(in:5...10)
    print("피로도가 \(bodyCondition.degreeOfFatigue) 하락합니다.")
    bodyCondition.printCondition()
})



