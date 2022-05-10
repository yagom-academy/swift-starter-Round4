import Foundation

struct Exercise {
    let name: String
    let action: () -> Void
}

let sitUp = Exercise(name: "윗몸일으키기") {
    myInitialBodyCondition.upperBodyStrength += myInitialBodyCondition.createRandomStrength(between: 10...20)
    myInitialBodyCondition.fatigue += myInitialBodyCondition.createRandomStrength(between: 10...20)
}

let squat = Exercise(name: "스쿼트") {
    myInitialBodyCondition.lowerBodyStrength += myInitialBodyCondition.createRandomStrength(between: 20...30)
    myInitialBodyCondition.fatigue += myInitialBodyCondition.createRandomStrength(between: 10...20)
}

let runningLongTime = Exercise(name: "오래 달리기") {
    myInitialBodyCondition.muscleEndurance += myInitialBodyCondition.createRandomStrength(between: 20...30)
    myInitialBodyCondition.upperBodyStrength += myInitialBodyCondition.createRandomStrength(between: 5...10)
    myInitialBodyCondition.lowerBodyStrength += myInitialBodyCondition.createRandomStrength(between: 5...10)
    myInitialBodyCondition.fatigue += myInitialBodyCondition.createRandomStrength(between: 20...30)
}

let activeRest = Exercise(name: "동적휴식") {
    myInitialBodyCondition.fatigue -= myInitialBodyCondition.createRandomStrength(between: 5...10)
}

let deadLift = Exercise(name: "데드리프트") {
    myInitialBodyCondition.upperBodyStrength += myInitialBodyCondition.createRandomStrength(between: 15...35)
    myInitialBodyCondition.lowerBodyStrength += myInitialBodyCondition.createRandomStrength(between: 10...20)
    myInitialBodyCondition.fatigue += myInitialBodyCondition.createRandomStrength(between: 15...30)
}
