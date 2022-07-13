//
//  step1.swift
//  CodeStarterCamp_Week4
//
//  Created by 한서영 on 2022/07/12.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int = 0 {
        didSet {
            self.printChangedCondition("상체근력", distance: upperBodyStrength - oldValue)
        }
    }
    var lowerBodyStrength: Int = 0 {
        didSet {
            self.printChangedCondition("하체근력", distance: lowerBodyStrength - oldValue)
        }
    }
    var muscularEndurance: Int = 0 {
        didSet {
            self.printChangedCondition("근지구력", distance: muscularEndurance - oldValue)
        }
    }
    var fatigue: Int = 0 {
        didSet {
            self.printChangedCondition("피로도", distance: fatigue - oldValue)
        }
    }
    
    func printChangedCondition(_ conditionName: String, distance: Int) {
        if distance > 0 {
            print("\(conditionName)이(가) \(distance) 상승합니다.")
        } else {
            print("\(conditionName)이(가) \((-1) * distance) 하락합니다.")
        }
    }
    
    func changeCondition(_ conditionName: String, degree: Int) {
        switch (conditionName) {
        case "상체근력": self.upperBodyStrength += degree
        case "하체근력": self.lowerBodyStrength += degree
        case "근지구력": self.muscularEndurance += degree
        case "피로도": self.fatigue += degree
        default: break
        }
    }
    
    func printTotalCondition() {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(self.upperBodyStrength)")
        print("하체근력: \(self.lowerBodyStrength)")
        print("근지구력: \(self.muscularEndurance)")
        print("피로도: \(self.fatigue)")
        print("--------------")
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
    
    func printStartActivity() {
        print("<<\(self.name)을(를) 시작합니다>>")
    }
}

let 윗몸일으키기: Activity = Activity(name: "윗몸일으키기", action: { (bodyCondition: BodyCondition) in
    윗몸일으키기.printStartActivity()
    
    bodyCondition.changeCondition("상체근력", degree: Int.random(in: 10...20))
    bodyCondition.changeCondition("하체근력", degree: Int.random(in: 10...20))
    
    bodyCondition.printTotalCondition()
})

let 스쿼트: Activity = Activity(name: "스쿼트", action: { (bodyCondition: BodyCondition) in
    스쿼트.printStartActivity()
    
    bodyCondition.changeCondition("하체근력", degree: Int.random(in: 20...30))
    bodyCondition.changeCondition("피로도", degree: Int.random(in: 10...20))
    
    bodyCondition.printTotalCondition()
})

let 오래달리기: Activity = Activity(name: "오래달리기", action: { (bodyCondition: BodyCondition) in
    오래달리기.printStartActivity()
    
    bodyCondition.changeCondition("근지구력", degree: Int.random(in: 20...30))
    bodyCondition.changeCondition("상체", degree: Int.random(in: 5...10))
    bodyCondition.changeCondition("하체", degree: Int.random(in: 5...10))
    bodyCondition.changeCondition("피로도", degree: Int.random(in: 20...30))
    
    bodyCondition.printTotalCondition()
})

let 동적휴식: Activity = Activity(name: "동적휴식", action: { (bodyCondition: BodyCondition) in
    동적휴식.printStartActivity()
    
    bodyCondition.changeCondition("피로도", degree: Int.random(in: -10 ...  -5))
    
    bodyCondition.printTotalCondition()
})
