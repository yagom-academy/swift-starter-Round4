//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BodyCondition {
    var name: String
    var upperBodyMuscleStrength: Int
    var lowerBodyMuscleStrength: Int
    var muscularEndurance: Int
    var tiredness: Int
    
    var activity: Activity? {
        didSet {
            guard let activityName = activity?.name else {
                print("활동 이름값이 없습니다.")
                return
            }
            print("<<\(name)이(가) \(activityName)을(를) 시작합니다>>")
            activity?.action(self)
        }
    }
    
    init(name: String, upperBodyMuscleStrength: Int = 0, lowerBodyMuscleStrength: Int = 0, muscularEndurance: Int = 0, tiredness: Int = 0) {
        self.name = name
        self.upperBodyMuscleStrength = upperBodyMuscleStrength
        self.lowerBodyMuscleStrength = lowerBodyMuscleStrength
        self.muscularEndurance = muscularEndurance
        self.tiredness = tiredness
    }
    
    func printCondition() {
        print("--------------")
        print("현재 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyMuscleStrength)")
        print("하체근력: \(lowerBodyMuscleStrength)")
        print("근지구력: \(muscularEndurance)")
        print("피로도: \(tiredness)")
        print("--------------")
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기") { (bodyCondition: BodyCondition) -> Void in
    
    let upperBodyMuscleStrength = Int.random(in: 10...20)
    let tiredness = Int.random(in: 10...20)
    
    print("상체근력이 \(upperBodyMuscleStrength) 상승합니다.")
    print("피로도가 \(tiredness) 상승합니다.")
    
    bodyCondition.upperBodyMuscleStrength += upperBodyMuscleStrength
    bodyCondition.tiredness += tiredness
}

let 스쿼트: Activity = Activity(name: "스쿼트") { (bodyCondition: BodyCondition) -> Void in
    
    let lowerBodyMuscleStrength = Int.random(in: 20...30)
    let tiredness = Int.random(in: 10...20)
    
    print("하체근력이 \(lowerBodyMuscleStrength) 상승합니다.")
    print("피로도가 \(tiredness) 상승합니다.")
    
    bodyCondition.lowerBodyMuscleStrength += lowerBodyMuscleStrength
    bodyCondition.tiredness += tiredness
}

let 오래달리기: Activity = Activity(name: "오래달리기") { (bodyCondition: BodyCondition) -> Void in
    
    let muscularEndurance = Int.random(in: 20...30)
    let upperBodyMuscleStrength = Int.random(in: 5...10)
    let lowerBodyMuscleStrength = Int.random(in: 5...10)
    let tiredness = Int.random(in: 20...30)
    
    print("근지구력이 \(muscularEndurance) 상승합니다.")
    print("상체근력이 \(upperBodyMuscleStrength) 상승합니다.")
    print("하체근력이 \(lowerBodyMuscleStrength) 상승합니다.")
    print("피로도가 \(tiredness) 상승합니다.")
    
    bodyCondition.muscularEndurance += muscularEndurance
    bodyCondition.upperBodyMuscleStrength += upperBodyMuscleStrength
    bodyCondition.lowerBodyMuscleStrength += lowerBodyMuscleStrength
    bodyCondition.tiredness += tiredness
}

let 동적휴식: Activity = Activity(name: "동적휴식") {(bodyCondition: BodyCondition) -> Void in
    
    let tiredness = Int.random(in: 5...10)
    
    print("피로도가 \(tiredness) 감소합니다.")
    
    bodyCondition.tiredness -= tiredness
}

let 스트레칭: Activity = Activity(name: "스트레칭") {(bodyCondition: BodyCondition) -> Void in
    
    let upperBodyMuscleStrength = Int.random(in: 1...5)
    let lowerBodyMuscleStrength = Int.random(in: 1...5)
    let tiredness = Int.random(in: 1...5)
    
    print("상체근력이 \(upperBodyMuscleStrength) 상승합니다.")
    print("하체근력이 \(lowerBodyMuscleStrength) 상승합니다.")
    print("피로도가 \(tiredness) 감소합니다.")
    
    bodyCondition.upperBodyMuscleStrength += upperBodyMuscleStrength
    bodyCondition.lowerBodyMuscleStrength += lowerBodyMuscleStrength
    bodyCondition.tiredness -= tiredness
}

var dasanBodyCondition = BodyCondition(name: "다산")
dasanBodyCondition.activity = 윗몸일으키기
dasanBodyCondition.printCondition()

var namuBodyCondition = BodyCondition(name: "나무", upperBodyMuscleStrength: 50, lowerBodyMuscleStrength: 50, muscularEndurance: 50, tiredness: 10)
namuBodyCondition.activity = 스트레칭
namuBodyCondition.printCondition()


