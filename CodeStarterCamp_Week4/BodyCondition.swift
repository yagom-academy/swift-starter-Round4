//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by eve on 2023/03/13.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int {
        willSet {
            printChangeCondition(subject: "상체근력이", from: upperBodyStrength, to: newValue)
        }
    }
    var lowerBodyStrength: Int {
        willSet {
            printChangeCondition(subject: "하체근력이", from: lowerBodyStrength, to: newValue)
        }
    }
    var muscularEndurance: Int {
        willSet {
            printChangeCondition(subject: "근지구력이", from: muscularEndurance, to: newValue)
        }
    }
    var fatigue: Int {
        willSet {
            printChangeCondition(subject: "피로도가", from: fatigue, to: newValue)
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
    
    func checkBody() {
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
