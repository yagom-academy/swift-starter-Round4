//
//  File.swift
//  CodeStarterCamp_Week4
//
//  Created by redmango1446 on 2023/03/18.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int {
        didSet(beforeValue) {
            printCondition(subScripts: "상체근력이", beforeValue: beforeValue, afterValue: upperBodyStrength)
        }
    }
    var lowerBodyStrength: Int {
        didSet(beforeValue) {
            printCondition(subScripts: "하체근력이", beforeValue: beforeValue, afterValue: lowerBodyStrength)
        }
    }
    var muscularEndurance: Int {
        didSet(beforeValue) {
            printCondition(subScripts: "근지구력이", beforeValue: beforeValue, afterValue: muscularEndurance)
        }
    }
    var fatigue: Int {
        didSet(beforeValue) {
            printCondition(subScripts: "피로도가", beforeValue: beforeValue, afterValue: fatigue)
            print("-----------")
        }
    }
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func checkCondition() {
        print("""
              현재의 컨디션은 다음과 같습니다.
              상체근력: \(upperBodyStrength)
              하체근력: \(lowerBodyStrength)
              근지구력: \(muscularEndurance)
              피로도: \(fatigue)
              -----------
              """)
    }
    
    func printCondition(subScripts: String, beforeValue: Int, afterValue : Int) {
        if beforeValue < afterValue {
            print("\(subScripts) \(afterValue - beforeValue) 상승합니다.")
        } else if beforeValue > afterValue {
            print("\(subScripts) \(beforeValue - afterValue) 하락합니다.")
        }
    }
}


