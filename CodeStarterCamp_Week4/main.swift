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
