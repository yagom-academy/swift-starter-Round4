//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by ByungHoon Ann on 2022/11/08.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int {
        didSet {
            guard upperBodyStrength - oldValue > 0 else { return }
            print("상체근력이 \(upperBodyStrength - oldValue) 상승합니다.")
        }
    }
    
    var lowerBodyStrength: Int {
        didSet {
            guard lowerBodyStrength - oldValue > 0 else { return }
            print("하체근력이 \(lowerBodyStrength - oldValue) 상승합니다.")
        }
    }
    
    var muscularEndurance: Int {
        didSet {
            guard muscularEndurance - oldValue > 0 else { return }
            print("근지구력이 \(muscularEndurance - oldValue) 상승합니다.")
        }
    }
    
    var fatigue: Int {
        didSet {
            let detection = fatigue < oldValue
            let resultText = detection ? "감소합니다." : "상승합니다."
            let amount = detection ? oldValue - fatigue : fatigue - oldValue
            print("""
                  피로도가 \(amount) \(resultText)
                  -----------
                  """)
        }
    }
    
    init(upperBodyStrength: Int = 100,
         lowerBodyStrength: Int = 100,
         muscularEndurance: Int = 100,
         fatigue: Int = 0) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func printCondition() {
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
