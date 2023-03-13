//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by eve on 2023/03/13.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int {
        didSet {
            printChangeCondition(subject: "상체근력이", from: oldValue, to: upperBodyStrength)
        }
    }
    var lowerBodyStrength: Int {
        didSet {
            printChangeCondition(subject: "하체근력이", from: oldValue, to: lowerBodyStrength)
        }
    }
    var muscularEndurance: Int {
        didSet {
            printChangeCondition(subject: "근지구력이", from: oldValue, to: muscularEndurance)
        }
    }
    var fatigue: Int {
        didSet {
            printChangeCondition(subject: "피로도가", from: oldValue, to: fatigue)
        }
    }
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    private func printChangeCondition(subject: String, from oldStrength: Int, to changeStrength: Int) {
        if changeStrength > oldStrength {
            print("\(subject) \(changeStrength - oldStrength) 상승합니다.")
        } else {
            print("\(subject) \(oldStrength - changeStrength) 하락합니다.")
        }
    }
}

func checkBody(_ condition: BodyCondition) {
    print("""
    현재의 컨디션은 다음과 같습니다.
    상체근력: \(condition.upperBodyStrength)
    하체근력: \(condition.lowerBodyStrength)
    근지구력: \(condition.muscularEndurance)
    피로도: \(condition.fatigue)
    --------------
    
    """)
}
