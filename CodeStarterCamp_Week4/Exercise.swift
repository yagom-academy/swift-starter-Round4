import Foundation

struct Exercise {
    let name: String
    let action: (BodyCondition) -> Void
}

let sitUp = Exercise(name: "윗몸일으키기") {
    $0.upperBodyStrength += $0.createRandomStrength(between: 10...20)
    $0.fatigue += $0.createRandomStrength(between: 10...20)
}

let squat = Exercise(name: "스쿼트") {
    $0.lowerBodyStrength += $0.createRandomStrength(between: 20...30)
    $0.fatigue += $0.createRandomStrength(between: 10...20)
}

let runningLongTime = Exercise(name: "오래 달리기") {
    $0.muscleEndurance += $0.createRandomStrength(between: 20...30)
    $0.upperBodyStrength += $0.createRandomStrength(between: 5...10)
    $0.lowerBodyStrength += $0.createRandomStrength(between: 5...10)
    $0.fatigue += $0.createRandomStrength(between: 20...30)
}

let activeRest = Exercise(name: "동적휴식") {
    $0.fatigue -= $0.createRandomStrength(between: 5...10)
}

let deadLift = Exercise(name: "데드리프트") {
    $0.upperBodyStrength += $0.createRandomStrength(between: 15...35)
    $0.lowerBodyStrength += $0.createRandomStrength(between: 10...20)
    $0.fatigue += $0.createRandomStrength(between: 15...30)
}
