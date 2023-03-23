struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
    
    func perform() {
        print("<<\(self.name)을(를) 시작합니다>>")
    }
}

let sitUps = { (bodyCondition: BodyCondition) -> () in
    bodyCondition.changeUpperBodyStrength(by: Int.random(in: 10...20))
    bodyCondition.changeFatigueLevel(by: Int.random(in: 10...20))
}

let squats = { (bodyCondition: BodyCondition) -> () in
    bodyCondition.changeLowerBodyStrength(by: Int.random(in: 20...30))
    bodyCondition.changeFatigueLevel(by: Int.random(in: 10...20))
}

let longDistance = { (bodyCondition: BodyCondition) -> () in
    bodyCondition.changeMuscularEndurance(by: Int.random(in: 20...30))
    bodyCondition.changeUpperBodyStrength(by: Int.random(in: 5...10))
    bodyCondition.changeLowerBodyStrength(by: Int.random(in: 5...10))
    bodyCondition.changeFatigueLevel(by: Int.random(in: 20...30))
}

let resting = { (bodyCondition: BodyCondition) -> () in
    bodyCondition.changeFatigueLevel(by: Int.random(in: 5...10) * -1)
}

let performSitUps = Activity(name: "윗몸일으키기", action: sitUps)
let performSquats: Activity = Activity(name: "스쿼트", action: squats)
let runLogDistance: Activity = Activity(name: "오래달리기", action: longDistance)
let dynamicResting: Activity = Activity(name: "동적휴식", action: resting)
