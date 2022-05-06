import Foundation

struct BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscleEndurance: Int
    var fatigue: Int

    func createRandomStrengthPoint(between range: ClosedRange<Int>) -> Int {
        return Int.random(in: range)
    }
}

var myBodyCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscleEndurance: 0, fatigue: 0)

struct Exercise {
    let name: String
    let action: () -> Void
}

let sitUp = Exercise(name: "윗몸일으키기") {
    myBodyCondition.upperBodyStrength += myBodyCondition.createRandomStrengthPoint(between: 10...20)
    myBodyCondition.fatigue += myBodyCondition.createRandomStrengthPoint(between: 10...20)
}

let squat = Exercise(name: "스쿼트") {
    myBodyCondition.lowerBodyStrength += myBodyCondition.createRandomStrengthPoint(between: 20...30)
    myBodyCondition.fatigue += myBodyCondition.createRandomStrengthPoint(between: 10...20)
}

let runningLongTime = Exercise(name: "오래 달리기") {
    myBodyCondition.muscleEndurance += myBodyCondition.createRandomStrengthPoint(between: 20...30)
    myBodyCondition.upperBodyStrength += myBodyCondition.createRandomStrengthPoint(between: 5...10)
    myBodyCondition.lowerBodyStrength += myBodyCondition.createRandomStrengthPoint(between: 5...10)
    myBodyCondition.fatigue += myBodyCondition.createRandomStrengthPoint(between: 20...30)
}

let activeRest = Exercise(name: "동적휴식") {
    myBodyCondition.fatigue -= myBodyCondition.createRandomStrengthPoint(between: 5...10)
}

struct Routine {
    let name: String
    let routineOrder: [Exercise]

    func startRoutine() {
        print("--------------")
        print("\(name)을 시작합니다.")
        calculateBodyConditionStrengthPoints()
        printRoutineNames()
        print("--------------")
    }

    func calculateBodyConditionStrengthPoints() {
        for index in 0..<routineOrder.count {
            routineOrder[index].action()
        }
    }

    func printRoutineNames() {
        for index in 0..<routineOrder.count {
            print("\(routineOrder[index].name)")
        }
    }

    func printBodyConditionPoints(in bodyCondition: BodyCondition) {
        var condition: [Int] = []
        condition.append(bodyCondition.upperBodyStrength)
        condition.append(bodyCondition.lowerBodyStrength)
        condition.append(bodyCondition.muscleEndurance)
        condition.append(bodyCondition.fatigue)
        print("현재의 컨디션은 다음과 같습니다.")
        for index in 0..<condition.count {
            print(condition[index])
        }
    }
}


var myRoutine = Routine(name: "My Routine", routineOrder: [sitUp, squat, runningLongTime, activeRest])
myRoutine.startRoutine()
myRoutine.printBodyConditionPoints(in: myBodyCondition)

