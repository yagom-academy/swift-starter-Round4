struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let sitUp: Activity = Activity(name: "윗몸일으키기") { (bodyCondition) in
    print("<<윗몸일으키기를 시작합니다>>")
    bodyCondition.upperBodyStrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
    print("--------------")
}
let squat: Activity = Activity(name: "스쿼트") { (bodyCondition) in
    print("<<스쿼트를 시작합니다>>")
    bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
    print("--------------")
}
let longRun: Activity = Activity(name: "오래달리기") { (bodyCondition) in
    print("<<오래달리기를 시작합니다>>")
    bodyCondition.muscularEndurance += Int.random(in: 20...30)
    bodyCondition.upperBodyStrength += Int.random(in: 5...10)
    bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    bodyCondition.fatigue += Int.random(in: 20...30)
    print("--------------")
}
let activeRest: Activity = Activity(name: "동적휴식") { (bodyCondition) in
    print("<<동적휴식을 시작합니다>>")
    bodyCondition.fatigue -= Int.random(in: 5...10)
    print("--------------")
}


