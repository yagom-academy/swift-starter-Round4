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

enum ActivityError: Error {
    case over100bodyFatigue
    case inputException
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
    print("상체근력이 \(valueOfIncreaseUpperBodyMuscleStrength) 상승합니다.")
    print("피로도가 \(valueOfIncreaseBodyFatigue) 상승합니다.")
    print("--------------")
})

let squart: Activity = Activity(name: "스쿼트", action: { bodyCondition in
    let valueOfIncreaseLowerBodyMuscleStrength = bodyCondition.increaseMuscleStrength(inputRange: .large)
    let valueOfIncreaseBodyFatigue = bodyCondition.increaseMuscleStrength(inputRange: .medium)
    bodyCondition.lowerBodyMuscleStrength += valueOfIncreaseLowerBodyMuscleStrength
    bodyCondition.bodyFatigue += valueOfIncreaseBodyFatigue
    print("하체근력이 \(valueOfIncreaseLowerBodyMuscleStrength) 상승합니다.")
    print("피로도가 \(valueOfIncreaseBodyFatigue) 상승합니다.")
    print("--------------")
})

let activeRest: Activity = Activity(name: "동적휴식", action: { bodyCondition in
    let valueOfDecreaseBodyFatigue = bodyCondition.increaseMuscleStrength(inputRange: .small)
    if (bodyCondition.bodyFatigue - valueOfDecreaseBodyFatigue < 0) {
        bodyCondition.bodyFatigue = 0
        print("피로도가 0이 되었습니다.")
        print("--------------")
    } else {
        bodyCondition.bodyFatigue -= valueOfDecreaseBodyFatigue
        print("피로도가 \(valueOfDecreaseBodyFatigue) 하락합니다.")
        print("--------------")
    }
})

func doExercise(of routine: Routine, for bodyCondition: inout BodyCondition, repeat routineOrder: UInt) {
    var numberOfRoutineInKorean: String
    
    switch routineOrder {
    case 1:
        numberOfRoutineInKorean = "첫"
    case 2:
        numberOfRoutineInKorean = "두"
    case 3:
        numberOfRoutineInKorean = "세"
    case 4:
        numberOfRoutineInKorean = "네"
    case 5:
        numberOfRoutineInKorean = "다섯"
    case 6:
        numberOfRoutineInKorean = "여섯"
    case 7:
        numberOfRoutineInKorean = "일곱"
    case 8:
        numberOfRoutineInKorean = "여덟"
    case 9:
        numberOfRoutineInKorean = "아홉"
    default:
        numberOfRoutineInKorean = String(routineOrder)
    }
    
    print(
        """
        \(numberOfRoutineInKorean) 번째 \(routine.name)을(를) 시작합니다
        """)
    for orderExercise in 0...2 {
        print("<<\(routine.activities[Int(orderExercise)].name)을(를) 시작합니다>>")
        routine.activities[Int(orderExercise)].action(&bodyCondition)
    }
}


func startRoutine(of routine: Routine, for bodyCondition: inout BodyCondition) {
    print("루틴을 몇 번 반복할까요?")
    while let input = readLine() {
        if let numberOfRoutine = UInt(input) {
            print("--------------")
            for routineOrder in 1...numberOfRoutine {
                doExercise(of: routine, for: &bodyCondition, repeat: routineOrder)
            }
            bodyCondition.printCondition()
        } else {
            print("잘못된 입력 형식입니다. 다시 입력해주세요.")
            print("루틴을 몇 번 반복할까요?")
        }
    }
}

