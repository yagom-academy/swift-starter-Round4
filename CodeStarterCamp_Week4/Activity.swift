struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
    
    func start(bodyCondition: BodyCondition) {
        print("<<\(self.name)을(를) 시작합니다>>")
        action(bodyCondition)
    }
}

let sitUp = Activity(name: "윗몸일으키기", action: { (bodyCondition: BodyCondition) -> () in
    bodyCondition.changeUpperBodyStrength(by: Int.random(in: 10...20))
    bodyCondition.changeFatigueLevel(by: Int.random(in: 10...20))
    bodyCondition.showBodyCondition()
})

let squats: Activity = Activity(name: "스쿼트", action: { (bodyCondition: BodyCondition) -> () in
    bodyCondition.changeLowerBodyStrength(by: Int.random(in: 20...30))
    bodyCondition.changeFatigueLevel(by: Int.random(in: 10...20))
    bodyCondition.showBodyCondition()
})

let longDistanceRunning: Activity = Activity(name: "오래달리기", action: { (bodyCondition: BodyCondition) -> () in
    bodyCondition.changeMuscularEndurance(by: Int.random(in: 20...30))
    bodyCondition.changeUpperBodyStrength(by: Int.random(in: 5...10))
    bodyCondition.changeLowerBodyStrength(by: Int.random(in: 5...10))
    bodyCondition.changeFatigueLevel(by: Int.random(in: 20...30))
    bodyCondition.showBodyCondition()
})

let dynamicResting: Activity = Activity(name: "동적휴식", action: { (bodyCondition: BodyCondition) -> () in
    bodyCondition.changeFatigueLevel(by: Int.random(in: 5...10) * -1)
    bodyCondition.showBodyCondition()
})
