class BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    init(upper: Int = 0, lower: Int = 0, muscular: Int = 0, fatigue: Int = 0) {
        upperBodyStrength = upper
        lowerBodyStrength = lower
        muscularEndurance = muscular
        self.fatigue = fatigue
    }
    
    func checkCondition() {
        print("현재 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyStrength)\n하체근력: \(lowerBodyStrength)\n근지구력: \(muscularEndurance)\n피로도 : \(fatigue)")
    }
    
    func randomIntBetween(_ a: Int, _ b: Int) -> Int {
        return Int.random(in: a...b)
    }
}

struct Exercise {
    let name: String
    let action: (BodyCondition) -> Void
}

struct Routine {
    let name: String
    let person: BodyCondition
    let routines: [Exercise]
    
    init(name: String, person: BodyCondition, routines: [Exercise]) {
        self.name = name
        self.person = person
        self.routines = routines
    }

    func start() {
        print("--------------------------")
        print("\(name)을 시작합니다.")
        for exercise in routines {
            print(exercise.name)
            exercise.action(person)
        }
        print("--------------------------")
        person.checkCondition()
    }
}
