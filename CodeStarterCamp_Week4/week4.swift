class BodyCondition {
    var upperBodyStrength: Int = 0
    var lowerBodyStrength: Int = 0
    var muscularEndurance: Int = 0
    var fatigue: Int = 0
    
    init(upper: Int = 0, lower: Int = 0, muscular: Int = 0, fatigue: Int = 0) {
        upperBodyStrength = upper
        lowerBodyStrength = lower
        muscularEndurance = muscular
        self.fatigue = fatigue
    }
    
    func printCondition() {
        print("현재 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyStrength)")
        print("하체근력: \(lowerBodyStrength)")
        print("근지구력: \(muscularEndurance)")
        print("피로도 : \(fatigue)")
    }
}

var vennie = BodyCondition()

struct Exercise {
    let name: String
    let action: () -> Void
}

func randomIntBetween(_ a: Int, _ b: Int) -> Int {
    return Int.random(in: a...b)
}

let 윗몸일으키기 = Exercise(name: "윗몸일으키기", action: {
    vennie.upperBodyStrength += randomIntBetween(10, 20)
    vennie.fatigue += randomIntBetween(10, 20)
})

let 스쿼트 = Exercise(name: "스쿼트", action: {
    vennie.lowerBodyStrength += randomIntBetween(20, 30)
    vennie.fatigue += randomIntBetween(10, 20)
})

let 오래달리기 = Exercise(name: "오래달리기", action: {
    vennie.upperBodyStrength += randomIntBetween(5, 10)
    vennie.lowerBodyStrength += randomIntBetween(5, 10)
    vennie.muscularEndurance += randomIntBetween(20, 30)
    vennie.fatigue += randomIntBetween(20, 30)
})

let 동적휴식 = Exercise(name: "동적휴식", action: {
    vennie.fatigue -= randomIntBetween(5, 10)
    if vennie.fatigue < 0 {
        vennie.fatigue = 0
    }
})

class Routine {
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
            exercise.action()
        }
        print("--------------------------")
        person.printCondition()
    }
}
