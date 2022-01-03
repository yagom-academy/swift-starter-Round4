import Foundation

class BodyCondition {
    var upperBodyStrength: Int = 0
    var lowerBodyStrength: Int = 0
    var muscularEndurance: Int = 0
    var muscleFatigue: Int = 0
}

struct Exercise {
    let name: String
    let action: () -> Void
}

struct Routine {
    let name: String
    let exercises: [Exercise]
}

var Minseong = BodyCondition()

let sitUp: Exercise = Exercise(name: "윗몸일으키기") {
    Minseong.upperBodyStrength += Int.random(in: 10...20)
    Minseong.muscleFatigue += Int.random(in: 10...20)
}

let squat: Exercise = Exercise(name: "스쿼트") {
    Minseong.lowerBodyStrength += Int.random(in: 20...30)
    Minseong.muscleFatigue += Int.random(in: 10...20)
}

let longDistanceRunning: Exercise = Exercise(name: "오래달리기") {
    Minseong.muscularEndurance += Int.random(in: 20...30)
    Minseong.upperBodyStrength += Int.random(in: 5...10)
    Minseong.lowerBodyStrength += Int.random(in: 5...10)
    Minseong.muscleFatigue += Int.random(in: 20...30)
}

let activeRest: Exercise = Exercise(name: "동적휴식") {
    Minseong.muscleFatigue -= Int.random(in: 5...10)
}

