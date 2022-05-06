import Foundation

struct Exercise {
    let name: String
    let action: () -> Void
}

let sitUp = Exercise(name: "윗몸일으키기") {
    myBodyCondition.upperBodyStrength += myBodyCondition.createRandomStrength(between: 10...20)
    myBodyCondition.fatigue += myBodyCondition.createRandomStrength(between: 10...20)
}

let squat = Exercise(name: "스쿼트") {
    myBodyCondition.lowerBodyStrength += myBodyCondition.createRandomStrength(between: 20...30)
    myBodyCondition.fatigue += myBodyCondition.createRandomStrength(between: 10...20)
}

let runningLongTime = Exercise(name: "오래 달리기") {
    myBodyCondition.muscleEndurance += myBodyCondition.createRandomStrength(between: 20...30)
    myBodyCondition.upperBodyStrength += myBodyCondition.createRandomStrength(between: 5...10)
    myBodyCondition.lowerBodyStrength += myBodyCondition.createRandomStrength(between: 5...10)
    myBodyCondition.fatigue += myBodyCondition.createRandomStrength(between: 20...30)
}

let activeRest = Exercise(name: "동적휴식") {
    myBodyCondition.fatigue -= myBodyCondition.createRandomStrength(between: 5...10)
}

let deadLift = Exercise(name: "데드리프트") {
    myBodyCondition.upperBodyStrength += myBodyCondition.createRandomStrength(between: 15...35)
    myBodyCondition.lowerBodyStrength += myBodyCondition.createRandomStrength(between: 10...20)
    myBodyCondition.fatigue += myBodyCondition.createRandomStrength(between: 15...30)
}
