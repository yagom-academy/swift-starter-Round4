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

    func copy() -> BodyCondition {
        BodyCondition.init(with: self)
    }

    func setUpperBodyStrength(_ value: Int) {
        upperBodyStrength = value < 0 ? 0 : value
    }

    func setLowerBodyStrength(_ value: Int) {
        lowerBodyStrength = value < 0 ? 0 : value
    }

    func setMuscularEndurance(_ value: Int) {
        muscularEndurance = value < 0 ? 0 : value
    }

    func setFatigue(_ value: Int) {
        fatigue = value < 0 ? 0 : value
    }

    func changeMessage(from oldCondition: BodyCondition) -> String {
        var result = changeMessageStatus(name: "상체근력", from: oldCondition.upperBodyStrength, to: upperBodyStrength)
        result += changeMessageStatus(name: "하체근력", from: oldCondition.lowerBodyStrength, to: lowerBodyStrength)
        result += changeMessageStatus(name: "근지구력", from: oldCondition.muscularEndurance, to: muscularEndurance)
        result += changeMessageStatus(name: "피로도", from: oldCondition.fatigue, to: fatigue)

        return result
    }
}

// MARK: - Private

extension BodyCondition {
    private func changeMessageStatus(name: String, from oldValue: Int, to newValue: Int) -> String {
        if oldValue < newValue {
            return "\(name.koreanFinalSyllable(has: "이", not: "가")) \(newValue - oldValue) 상승합니다.\n"
        }
        else if oldValue > newValue {
            return "\(name.koreanFinalSyllable(has: "이", not: "가")) \(oldValue - newValue) 하락합니다.\n"
        }
        else {
            return ""
        }
    }
}
