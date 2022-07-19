//
//  step1.swift
//  CodeStarterCamp_Week4
//
//  Created by 한서영 on 2022/07/12.
//

import Foundation

class BodyCondition {
    enum Conditions {
        case 상체근력
        case 하체근력
        case 근지구력
        case 피로도
    }
    
    var upperBodyStrength: Int = 0 {
        didSet {
            self.printChangedCondition("상체근력", degree: upperBodyStrength - oldValue)
        }
    }
    var lowerBodyStrength: Int = 0 {
        didSet {
            self.printChangedCondition("하체근력", degree: lowerBodyStrength - oldValue)
        }
    }
    var muscularEndurance: Int = 0 {
        didSet {
            self.printChangedCondition("근지구력", degree: muscularEndurance - oldValue)
        }
    }
    var fatigue: Int = 0 {
        didSet {
            self.printChangedCondition("피로도", degree: fatigue - oldValue)
        }
    }
    
    func printChangedCondition(_ conditionName: String, degree: Int) {
        if degree > 0 {
            print("\(conditionName)이(가) \(degree) 상승합니다.")
        } else {
            print("\(conditionName)이(가) \((-1) * degree) 하락합니다.")
        }
    }
    
    func changeCondition(_ condition: Conditions, degree: Int) {
        switch condition {
        case .상체근력: self.upperBodyStrength += degree
        case .하체근력: self.lowerBodyStrength += degree
        case .근지구력: self.muscularEndurance += degree
        case .피로도: self.fatigue += degree
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
