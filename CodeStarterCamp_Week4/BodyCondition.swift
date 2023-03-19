//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by 비모 on 2023/03/14.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int {
        didSet {
            printChanges(in: "상체근력", before: oldValue, after: upperBodyStrength)
        }
    }
    var lowerBodyStrength: Int {
        didSet {
            printChanges(in: "하체근력", before: oldValue, after: lowerBodyStrength)
        }
    }
    var muscularEndurance: Int {
        didSet {
            printChanges(in: "근지구력", before: oldValue, after: muscularEndurance)
        }
    }
    var fatigue: Int {
        didSet {
            if fatigue < 0 {
                fatigue = 0
            }
            printChanges(in: "피로도", before: oldValue, after: fatigue)
        }
    }
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func printChanges(in partName: String, before oldValue: Int, after newValue: Int) {
        if newValue > oldValue {
            print("\(partName)이(가) \(newValue - oldValue) 상승합니다.")
        } else if newValue < oldValue {
            print("\(partName)이(가) \(oldValue - newValue) 하락합니다.")
        }
    }
    
    func printCurrentBodyCondition() {
        print("""
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(upperBodyStrength)
        하체근력: \(lowerBodyStrength)
        근지구력: \(muscularEndurance)
        피로도: \(fatigue)
        --------------
        """)
    }
}
