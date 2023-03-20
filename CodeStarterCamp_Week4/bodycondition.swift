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
            guard upperBody != oldValue else { return }
            print("상체근력이 \(abs(upperBody-oldValue)) \(checkDirection(current: upperBody, old: oldValue))합니다.")
        }
    }
    var lowerBody: Int {
        didSet {
            guard lowerBody != oldValue else { return }
            print("하체근력이 \(abs(lowerBody-oldValue)) \(checkDirection(current: lowerBody, old: oldValue))합니다.")
        }
    }
    var endurance: Int {
        didSet {
            guard endurance != oldValue else { return }
            print("근지구력이 \(abs(endurance-oldValue)) \(checkDirection(current: endurance, old: oldValue))합니다.")
        }
    }
    var fatigue: Int {
        didSet {
            guard fatigue != oldValue else { return }
            print("피로도가 \(abs(fatigue-oldValue)) \(checkDirection(current: fatigue, old: oldValue))합니다.")
        }
    }
   
    func checkDirection(current: Int, old: Int) -> String {
        return current - old > 0 ? "상승" : "하락"
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
