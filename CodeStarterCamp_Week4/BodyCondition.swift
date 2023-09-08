//
//  BodyCondition.swift
//  CodeStarterCamp_Week4
//
//  Created by QL Jeong on 2023/09/07.
//

import Foundation

final class BodyCondition {
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

    init(from decoder: Decoder) throws {
        try decode(from: decoder)
    }
}

// MARK: - Codable Copy

extension BodyCondition: Codable {
    private enum CodingKeys : String, CodingKey {
        case upperBodyStrength,
             lowerBodyStrength,
             muscularEndurance,
             fatigue
    }

    var JSONString: String? {
        let JSONData = try! JSONEncoder().encode(self)

        return String(data: JSONData, encoding: .utf8)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: BodyCondition.CodingKeys.self)
        try container.encode(upperBodyStrength, forKey: .upperBodyStrength)
        try container.encode(lowerBodyStrength, forKey: .lowerBodyStrength)
        try container.encode(muscularEndurance, forKey: .muscularEndurance)
        try container.encode(fatigue, forKey: .fatigue)
    }

    func decode(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BodyCondition.CodingKeys.self)
        upperBodyStrength = try container.decode(Int.self, forKey: .upperBodyStrength)
        lowerBodyStrength = try container.decode(Int.self, forKey: .lowerBodyStrength)
        muscularEndurance = try container.decode(Int.self, forKey: .muscularEndurance)
        fatigue = try container.decode(Int.self, forKey: .fatigue)
    }

    func copy() -> BodyCondition {
        let encodeData = try! JSONEncoder().encode(self)
        let decodeData = try! JSONDecoder().decode(BodyCondition.self, from: encodeData)

        return decodeData
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

    func changeMessage(from oldCondition: BodyCondition) -> String {
        var result = changeMessageStatus(name: "상체근력", from: upperBodyStrength, to: oldCondition.upperBodyStrength)
        result += changeMessageStatus(name: "하체근력", from: lowerBodyStrength, to: oldCondition.lowerBodyStrength)
        result += changeMessageStatus(name: "근지구력", from: muscularEndurance, to: oldCondition.muscularEndurance)
        result += changeMessageStatus(name: "피로도", from: fatigue, to: oldCondition.fatigue)

        return result
    }
}

// MARK: - Private

extension BodyCondition {
    private func changeMessageStatus(name: String, from: Int, to: Int) -> String {
        if from > to {
            return "\(name.koreanFinalSyllable(has: "이", not: "가")) \(from - to) 상승합니다.\n"
        }
        else if from < to {
            return "\(name.koreanFinalSyllable(has: "이", not: "가")) \(to - from) 하락합니다.\n"
        }
        else {
            return ""
        }
    }
}
