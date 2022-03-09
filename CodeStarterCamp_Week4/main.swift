import Foundation

class BodyCondition {
    var upperBodyStrength:Int = 0
    var lowerBodyStrength:Int = 0
    var muscularEndurance:Int = 0
    var fatigue:Int = 0

    func sitUp() {
        self.upperBodyStrength += Int.random(in: 10...20)
        self.fatigue += Int.random(in: 10...20)
    }
    func doSquat() {
        self.lowerBodyStrength += Int.random(in: 20...30)
        self.fatigue += Int.random(in: 10...20)
    }
    func runLongtime() {
        self.muscularEndurance += Int.random(in: 20...30)
        self.upperBodyStrength += Int.random(in: 5...10)
        self.lowerBodyStrength += Int.random(in: 5...10)
        self.fatigue += Int.random(in: 20...30)
    }
    func doActiveRest() {
        self.fatigue -= Int.random(in: 5...10)
    }
}

struct Exercise {
    let name: String
    let action: () -> Void
}

class Routine {
    let name: String
    var exercises: [Exercise]

    init(name: String, exercises: [Exercise]) {
        self.name = name
        self.exercises = exercises
    }
}

func doRoutine(routine: Routine) {
    print("--------------")
    print("\(routine.name)을 시작합니다.")

    for i in 0...routine.exercises.count - 1 {
        routine.exercises[i].action()
        print(routine.exercises[i].name)
    }
    print("--------------")
}

var bodycondition = BodyCondition()

let 윗몸일으키기 = Exercise(name: "윗몸일으키기") {
    bodycondition.sitUp()
}
let 스쿼트 = Exercise(name: "스쿼트") {
    bodycondition.doSquat()
}
let 오래달리기 = Exercise(name: "오래달리기") {
    bodycondition.runLongtime()
}
let 동적휴식 = Exercise(name: "동적휴식") {
    bodycondition.doActiveRest()
}
let hellRoutine = Routine(name: "hellRoutine", exercises: [윗몸일으키기, 윗몸일으키기, 동적휴식, 스쿼트, 스쿼트, 동적휴식, 오래달리기, 오래달리기])
let normalRoutine = Routine(name: "normalRoutine", exercises: [윗몸일으키기,스쿼트,동적휴식,오래달리기])

doRoutine(routine: hellRoutine)

print("""
현재의 컨디션은 다음과 같습니다.
상체근력: \(bodycondition.upperBodyStrength)
하체근력: \(bodycondition.lowerBodyStrength)
근지구력: \(bodycondition.muscularEndurance)
피로도: \(bodycondition.fatigue)
""")

