//
//  bodycondition.swift
//  CodeStarterCamp_Week4
//
//  Created by MARY on 2023/03/14.
//

import Foundation

class BodyCondition {
    var upperBody: Int {
        didSet {
            let result = upperBody > oldValue ? "\(upperBody-oldValue) 상승" : "\(oldValue-upperBody) 하락"
            print("상체근력이 \(result)합니다.")
        }
    }
    var lowerBody: Int {
        didSet {
            let result = lowerBody > oldValue ? "\(lowerBody-oldValue) 상승" : "\(oldValue-lowerBody) 하락"
            print("하체근력이 \(result)합니다.")
        }
    }
    var endurance: Int {
        didSet {
            let result = endurance > oldValue ? "\(endurance-oldValue) 상승" : "\(oldValue-endurance) 하락"
            print("근지구력이 \(result)합니다.")
        }
    }
    var fatigue: Int {
        didSet {
            let result = fatigue > oldValue ? "\(fatigue-oldValue) 상승" : "\(oldValue-fatigue) 하락"
            print("피로도가 \(result)합니다.")
        }
    }

    func check() {
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBody)\n하체근력: \(lowerBody)\n근지구력: \(endurance)\n피로도: \(fatigue)")
        print("--------------")
    }
    
    init(upperBody: Int, lowerBody: Int, endurance: Int, fatigue: Int) {
        self.upperBody = upperBody
        self.lowerBody = lowerBody
        self.endurance = endurance
        self.fatigue = fatigue
    }
}


