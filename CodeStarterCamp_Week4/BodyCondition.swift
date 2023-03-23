//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by Dawn on 2023/03/20.
//

import Foundation

class BodyCondition {
    var upperBodyStrength: Int {
        didSet {
            if upperBodyStrength > oldValue {
                print("상체근력이 \(upperBodyStrength - oldValue) 상승합니다.")
            } else {
                print("상체근력이 \(oldValue - upperBodyStrength) 하락합니다.")
            }
        }
    }

    var lowerBodyStrength: Int {
        didSet {
            if lowerBodyStrength > oldValue {
                print("하체근력이 \(lowerBodyStrength - oldValue) 상승합니다.")
            } else {
                print("히체근력이 \(oldValue - lowerBodyStrength) 하락합니다.")
            }
        }
    }

    var muscularEndurance: Int {
        didSet {
            if muscularEndurance > oldValue {
                print("근지구력이 \(muscularEndurance - oldValue) 상승합니다.")
            } else {
                print("근지구력이 \(oldValue - muscularEndurance) 하락합니다.")
            }
        }
    }

    var fatigue: Int {
        didSet {
            if fatigue > oldValue {
                print("피로도가 \(fatigue - oldValue) 상승합니다.")
            } else {
                print("피로도가 \(oldValue - fatigue) 하락합니다.")
            }
        }
    }

    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }

    func checkBodyCondition() {
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

let dawn: BodyCondition = BodyCondition(upperBodyStrength: 10, lowerBodyStrength: 10, muscularEndurance: 10, fatigue: 10)
