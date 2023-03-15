//
//  body.swift
//  CodeStarterCamp_Week4
//
//  Created by Min Hyun on 2023/03/15.
//

import Foundation

class BodyCondition {
    var upperStrength: Int {
        didSet {
            printChangedCondition(of: "상체근력", from: oldValue, to: upperStrength)
        }
    }
    var lowerStrength: Int {
        didSet {
            printChangedCondition(of: "하체근력", from: oldValue, to: lowerStrength)
        }
    }
    var endurance: Int {
        didSet {
            printChangedCondition(of: "근지구력", from: oldValue, to: endurance)
        }
    }
    var fatigue: Int {
        didSet {
            printChangedCondition(of: "피로도", from: oldValue, to: fatigue)
        }
    }
    
    init(upperStrength: Int, lowerStrength: Int, endurance: Int, fatigue: Int) {
        self.upperStrength = upperStrength
        self.lowerStrength = lowerStrength
        self.endurance = endurance
        self.fatigue = fatigue
    }
    
    func exercise(_ activity: Activity) {
        print("<<\(activity.name)을(를) 시작합니다>>")
        activity.action(self)
        print("--------------")
    }
    
    func printChangedCondition(of bodyPart: String, from oldStatus: Int, to newStatus: Int) {
        if oldStatus > newStatus {
            print("\(bodyPart)이(가) \(oldStatus - newStatus) 감소합니다.")
        } else {
            print("\(bodyPart)이(가) \(newStatus - oldStatus) 증가합니다.")
        }
    }

    func checkBodyConditionStatus() {
        let currentBodyStatus: String = """
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(self.upperStrength)
        하체근력: \(self.lowerStrength)
        근지구력: \(self.endurance)
        피로도: \(self.fatigue)
        --------------
        """
        print(currentBodyStatus)
    }
}
