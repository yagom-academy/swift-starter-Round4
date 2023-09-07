//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by QL Jeong on 2023/09/07.
//

import Foundation

class BodyCondition {
    private(set) var upperBodyStrength = 0
    private(set) var lowerBodyStrength = 0
    private(set) var muscularEndurance = 0
    private(set) var fatigue = 0

    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }

    init(with bodyCondition: BodyCondition) {
        upperBodyStrength = bodyCondition.upperBodyStrength
        lowerBodyStrength = bodyCondition.lowerBodyStrength
        muscularEndurance = bodyCondition.muscularEndurance
        fatigue = bodyCondition.fatigue
    }
}

// MARK: - Public

extension BodyCondition {
    var statusMessage: String {
        var result = "상체근력: \(upperBodyStrength)\n"
        result += "하체근력: \(lowerBodyStrength)\n"
        result += "근지구력: \(muscularEndurance)\n"
        result += "피로도: \(fatigue)\n"

        return result
    }

    func setUpperBodyStrength(_ value: Int) {
        upperBodyStrength = value
    }

    func setLowerBodyStrength(_ value: Int) {
        lowerBodyStrength = value
    }

    func setMuscularEndurance(_ value: Int) {
        muscularEndurance = value
    }

    func setFatigue(_ value: Int) {
        fatigue = value
    }

    func diffMessage(withOld oldCondition: BodyCondition) -> String {
        var result = ""
        if upperBodyStrength != oldCondition.upperBodyStrength {
            if upperBodyStrength > oldCondition.upperBodyStrength {
                result += "상체근력이 \(upperBodyStrength - oldCondition.upperBodyStrength) 상승합니다.\n"
            } else {
                result += "상체근력이 \(oldCondition.upperBodyStrength - upperBodyStrength) 하락합니다.\n"
            }
        }
        if lowerBodyStrength != oldCondition.lowerBodyStrength {
            if lowerBodyStrength > oldCondition.lowerBodyStrength {
                result += "하체근력이 \(lowerBodyStrength - oldCondition.lowerBodyStrength) 상승합니다.\n"
            } else {
                result += "하체근력이 \(oldCondition.lowerBodyStrength - lowerBodyStrength) 하락합니다.\n"
            }
        }
        if muscularEndurance != oldCondition.muscularEndurance {
            if muscularEndurance > oldCondition.muscularEndurance {
                result += "근지구력이 \(muscularEndurance - oldCondition.muscularEndurance) 상승합니다.\n"
            } else {
                result += "근지구력이 \(oldCondition.muscularEndurance - muscularEndurance) 하락합니다.\n"
            }
        }
        if fatigue != oldCondition.fatigue {
            if fatigue > oldCondition.fatigue {
                result += "피로도가 \(fatigue - oldCondition.fatigue) 상승합니다.\n"
            } else {
                result += "피로도가 \(oldCondition.fatigue - fatigue) 하락합니다.\n"
            }
        }

        return result
    }
}
