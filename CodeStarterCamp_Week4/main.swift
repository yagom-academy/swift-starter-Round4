import Foundation

struct BodyCondition {
    var upperBodyStrength: Int = 0
    var lowerBodyStrength: Int = 0
    var muscleEndurance: Int = 0
    var fatigue: Int = 0
}

struct Exercise {
    let name: String
    let action: () -> Void
}

let sitUp = Exercise(name: "윗몸일으키기") {
    var bodyCondition = BodyCondition()

    bodyCondition.upperBodyStrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
}

let squat = Exercise(name: "스쿼트") {
    var bodyCondition = BodyCondition()

    bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
}

let runningLongTime = Exercise(name: "오래 달리기") {
    var bodyCondition = BodyCondition()

    bodyCondition.muscleEndurance += Int.random(in: 20...30)
    bodyCondition.upperBodyStrength += Int.random(in: 5...10)
    bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    bodyCondition.fatigue += Int.random(in: 20...30)
}

let activeRest = Exercise(name: "동적휴식") {
    var bodyCondition = BodyCondition()

    bodyCondition.fatigue -= Int.random(in: 5...10)
}


