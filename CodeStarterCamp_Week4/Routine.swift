//
//  Routine.swift
//  CodeStarterCamp_Week4
//
//  Created by 조성훈 on 2022/01/06.
//

struct Routine {
    var name: String
    var exerciseArray: [Exercise]
    
    init (name: String, exerciseArray: [Exercise]){
        self.name = name
        self.exerciseArray = exerciseArray
    }
}

struct Exercise {
    var name: String
    let action: (BodyCondition) -> Void
}

let randomNumberFiveToTen = Int.random(in: 5...10)
let randomNumberTenToTwenty = Int.random(in: 10...20)
let randomNumberTwentyToThirty = Int.random(in: 20...30)

let a: Exercise = Exercise(name: "a") { BodyCondition in
    BodyCondition.upperBodyStrength += randomNumberTenToTwenty
    BodyCondition.fatigue += randomNumberTenToTwenty
}
let sitUp: Exercise = Exercise(name: "윗몸일으키기") { BodyCondition in
    BodyCondition.upperBodyStrength += randomNumberTenToTwenty
    BodyCondition.fatigue += randomNumberTenToTwenty
}

let squat: Exercise = Exercise(name: "스쿼트") { BodyCondition in
    BodyCondition.lowerBodyStrength += randomNumberTwentyToThirty
    BodyCondition.fatigue += randomNumberTenToTwenty
}

let lunge: Exercise = Exercise(name: "런지") { BodyCondition in
    BodyCondition.lowerBodyStrength += randomNumberTwentyToThirty
    BodyCondition.fatigue += randomNumberTenToTwenty
}

let deadlift: Exercise = Exercise(name: "데드리프트") { BodyCondition in
    BodyCondition.upperBodyStrength += randomNumberTenToTwenty
    BodyCondition.lowerBodyStrength += randomNumberTwentyToThirty
    BodyCondition.fatigue += randomNumberTenToTwenty
}

let pushUp: Exercise = Exercise(name: "팔굽혀펴기"){ BodyCondition in
    BodyCondition.upperBodyStrength += randomNumberTwentyToThirty
    BodyCondition.lowerBodyStrength += randomNumberFiveToTen
    BodyCondition.fatigue += randomNumberTenToTwenty
}

let dumbbellPress: Exercise = Exercise(name: "덤벨프레스") { BodyCondition in
    BodyCondition.upperBodyStrength += randomNumberTwentyToThirty
    BodyCondition.fatigue += randomNumberTenToTwenty
}

let benchPress: Exercise = Exercise(name: "벤치프레스") { BodyCondition in
    BodyCondition.upperBodyStrength += randomNumberTwentyToThirty
    BodyCondition.fatigue += randomNumberTenToTwenty
}

let activeRest: Exercise = Exercise(name: "동적휴식") { BodyCondition in
    BodyCondition.fatigue -= randomNumberFiveToTen
}

let running: Exercise = Exercise(name: "오래달리기") { BodyCondition in
    BodyCondition.muscleEndurance += randomNumberTwentyToThirty
    BodyCondition.upperBodyStrength += randomNumberFiveToTen
    BodyCondition.lowerBodyStrength += randomNumberFiveToTen
    BodyCondition.fatigue += randomNumberTwentyToThirty
}
