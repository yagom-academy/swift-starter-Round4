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
            upperBody > oldValue ?
            print("상체근력이 \(upperBody-oldValue) 상승합니다.") :
            print("상체근력이 \(oldValue-upperBody) 하락합니다.")
        }
    }
    var lowerBody: Int {
        didSet {
            lowerBody > oldValue ?
            print("하체근력이 \(lowerBody-oldValue) 상승합니다.") :
            print("하체근력이 \(oldValue-lowerBody) 하락합니다.")
        }
    }
    var endurance: Int {
        didSet {
            endurance > oldValue ?
            print("근지구력이 \(endurance-oldValue) 상승합니다.") :
            print("근지구력이 \(oldValue-endurance) 하락합니다.")
        }
    }
    var fatigue: Int {
        didSet {
            fatigue > oldValue ?
            print("피로도가 \(fatigue-oldValue) 상승합니다.") :
            print("피로도가 \(oldValue-fatigue) 하락합니다.")
        }
    }

    func check() {
        print("--------------")
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


