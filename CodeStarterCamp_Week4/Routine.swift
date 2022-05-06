import Foundation

struct Routine {
    let name: String
    let routineOrder: [Exercise]

    func startRoutine() {
        print("--------------")
        print("\(name)을 시작합니다.")
        calculateBodyConditionStrength()
        printRoutineNames()
        print("--------------")
    }

    func printCurrentBodyCondition(with bodyCondition: BodyCondition) {
        var bodyConditionStrength: [Int] = []
        bodyConditionStrength.append(contentsOf:
                                        [bodyCondition.upperBodyStrength, bodyCondition.lowerBodyStrength, bodyCondition.muscleEndurance, bodyCondition.fatigue]
        )
        print("현재의 컨디션은 다음과 같습니다.")
        for index in 0..<bodyConditionStrength.count {
            print("\(bodyCondition.bodyConditionNamesInKorean[index]): \(bodyConditionStrength[index])")
        }
    }

    func calculateBodyConditionStrength() {
        for index in 0..<routineOrder.count {
            routineOrder[index].action()
        }
    }

    func printRoutineNames() {
        for index in 0..<routineOrder.count {
            print("\(routineOrder[index].name)")
        }
    }
}
