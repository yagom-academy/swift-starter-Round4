//
//  step2.swift
//  CodeStarterCamp_Week4
//
//  Created by smfc on 15/7/2022.
//
import Foundation

enum InputRange {
    case small
    case medium
    case large
}

struct Routine {
    let name: String
    let activities: Array<Activity> = [sitUp, activeRest, squart]
}

var hellRoutine: Routine = Routine(name: "hellRoutine")

struct BodyCondition {
    var upperBodyMuscleStrength: Int = 0
    var lowerBodyMuscleStrength: Int = 0
    var muscularEndurance: Int = 0
    var bodyFatigue: Int = 0
    
    mutating func increaseUpperBodyMuscleStrength(_ inputRange: InputRange) {
        let inputValue = increaseMuscleStrength(inputRange: inputRange)
        self.upperBodyMuscleStrength += inputValue
    }
    
    mutating func increaseLowerBodyMuscleStrength(_ inputRange: InputRange) {
        let inputValue = increaseMuscleStrength(inputRange: inputRange)
        self.lowerBodyMuscleStrength += inputValue
    }
    
    mutating func increaseMuscularEndurance(_ inputRange: InputRange) {
        let inputValue = increaseMuscleStrength(inputRange: inputRange)
        self.muscularEndurance += inputValue
    }
    
    mutating func increaseBodyFatigue(_ inputRange: InputRange) {
        let inputValue = increaseMuscleStrength(inputRange: inputRange)
        self.bodyFatigue += inputValue
    }
    
    mutating func decreaseBodyFatigue(_ inputRange: InputRange) {
        let inputValue = increaseMuscleStrength(inputRange: inputRange)
        self.bodyFatigue -= inputValue
    }
    
    func increaseMuscleStrength(inputRange: InputRange) -> Int {
        switch inputRange {
        case .small:
            return Int.random(in: 5...10)
        case .medium:
            return Int.random(in: 10...20)
        case .large:
            return Int.random(in: 20...30)
        }
    }
    
    func printCondition() {
        print("""
        --------------
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(upperBodyMuscleStrength)
        하체근력: \(lowerBodyMuscleStrength)
        근지구력: \(muscularEndurance)
        피로도: \(bodyFatigue)
        --------------
        """)
    }
}

var conditionOfJae: BodyCondition = BodyCondition()
var conditionOfYagom: BodyCondition = BodyCondition()

struct Activity {
    let name: String
    let action: (inout BodyCondition) -> Void
}

let sitUp: Activity = Activity(name: "윗몸일으키기", action: { bodyCondition in
    let valueOfIncreaseUpperBodyMuscleStrength = bodyCondition.increaseMuscleStrength(inputRange: .medium)
    let valueOfIncreaseBodyFatigue = bodyCondition.increaseMuscleStrength(inputRange: .medium)
    bodyCondition.upperBodyMuscleStrength += valueOfIncreaseUpperBodyMuscleStrength
    bodyCondition.bodyFatigue += valueOfIncreaseBodyFatigue
    print("상체근력이 \(valueOfIncreaseUpperBodyMuscleStrength)만큼 상승합니다.")
    print("피로도가 \(valueOfIncreaseBodyFatigue)만큼 상승합니다.")
})

let squart: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    let valueOfIncreaseLowerBodyMuscleStrength = bodyCondition.increaseMuscleStrength(inputRange: .large)
    let valueOfIncreaseBodyFatigue = bodyCondition.increaseMuscleStrength(inputRange: .medium)
    bodyCondition.lowerBodyMuscleStrength += valueOfIncreaseLowerBodyMuscleStrength
    bodyCondition.bodyFatigue += valueOfIncreaseBodyFatigue
    print("하체근력이 \(valueOfIncreaseLowerBodyMuscleStrength)만큼 상승합니다.")
    print("피로도가 \(valueOfIncreaseBodyFatigue)만큼 상승합니다.")
})

let activeRest: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    let valueOfDecreaseBodyFatigue = bodyCondition.increaseMuscleStrength(inputRange: .small)
    if (bodyCondition.bodyFatigue - valueOfDecreaseBodyFatigue < 0) {
        bodyCondition.bodyFatigue = 0
        print("피로도가 0이 되었습니다.")
    } else {
        bodyCondition.bodyFatigue -= valueOfDecreaseBodyFatigue
        print("피로도가 \(valueOfDecreaseBodyFatigue)만큼 하락합니다.")
    }
})

func doExercise(of activity: Activity, for bodyCondition: inout BodyCondition) {
    print(
        """
        <<\(activity.name)을(를) 시작합니다>>
        """)
    activity.action(&bodyCondition)
    bodyCondition.printCondition()
}
