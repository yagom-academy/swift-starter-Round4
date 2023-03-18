//
//  Step2.swift
//  CodeStarterCamp_Week4
//
//  Created by Daehoon Lee on 2023/03/14.
//

import Foundation

enum HealthTrainingError: Error {
    case invalidInput
    case overFatigability
}

struct Routine {
    var routineName: String
    var activities: Array<Activity>
    var notice: String = String()
    var startReminder: String {
        get {
            return notice
        }
        set(round) {
            self.notice = "\(round) 번째 \(routineName)을(를) 시작합니다."
        }
    }

    func checkInputValid() throws -> Int {
        guard let input = readLine(),
              let inputAsInt = Int(input)
        else {
            throw HealthTrainingError.invalidInput
        }

        return inputAsInt
    }
}

class BodyCondition {
    var upperBodyStrength: Int = 94 {
        didSet(oldValue) {
            print("상체근력이 \(upperBodyStrength - oldValue) 상승합니다.")
        }
    }
    var lowerBodyStrength: Int = 40 {
        didSet(oldValue) {
            print("하체근력이 \(lowerBodyStrength - oldValue) 상승합니다.")
        }
    }
    var muscularEndurance: Int = 90 {
        didSet(oldValue) {
            print("근지구력이 \(muscularEndurance - oldValue) 상승합니다.")
        }
    }
    var fatigability: Int = 8 {
        didSet(oldValue) {
            if fatigability >= oldValue {
                print("피로도가 \(fatigability - oldValue) 상승합니다.")
            } else {
                print("피로도가 \(oldValue - fatigability) 감소합니다.")
            }
        }
    }

    func printMeasuredBodyCondition() {
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(self.upperBodyStrength)")
        print("하체근력: \(self.lowerBodyStrength)")
        print("근지구력: \(self.muscularEndurance)")
        print("피로도: \(self.fatigability)")
        print("--------------")
    }

    func warnExcessiveFatigue() throws {
        guard self.fatigability < 100 else {
            throw HealthTrainingError.overFatigability
        }
    }
}

struct Activity {
    var name: String
    let action: (BodyCondition) throws -> Void
}
