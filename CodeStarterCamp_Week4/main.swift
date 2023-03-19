class BodyCondition {
    var upperBodyStrength: Int {
        willSet {
            print("상체근력이 \(newValue - upperBodyStrength) 상승합니다.")
        }
    }
    var lowerBodyStrength: Int {
        willSet {
            print("하체근력이 \(newValue - lowerBodyStrength) 상승합니다.")
        }
    }
    var muscularEndurance: Int {
        willSet {
            print("근지구력이 \(newValue - muscularEndurance) 상승합니다.")
        }
    }
    var fatigue: Int {
        willSet {
            if newValue > fatigue {
                print("피로도가 \(newValue - fatigue) 상승합니다.")
            } else {
                print("피로도가 \(fatigue - newValue) 하락합니다.")
            }
        }
    }
    
    init(upperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func checkCurrentBodyCondition() {
        print("--------------")
        print("현재의 컨디션은 다음과 같습니다.")
        print("상체근력: \(upperBodyStrength) \n하체근력: \(lowerBodyStrength) \n근지구력: \(muscularEndurance) \n피로도: \(fatigue)")
        print("--------------")
    }
}

struct Activity {
    let name: String
    let action: (BodyCondition) -> Void
}

let sitUp: Activity = Activity(name: "윗몸일으키기") { (bodyCondition) in
    print("<<윗몸일으키기를 시작합니다>>")
    bodyCondition.upperBodyStrength += Int.random(in: 10...20)
    bodyCondition.fatigue += Int.random(in: 10...20)
    bodyCondition.checkCurrentBodyCondition()
}
let squat: Activity = Activity(name: "스쿼트") { (bodyCondition) in
    print("<<스쿼트를 시작합니다>>")
    bodyCondition.lowerBodyStrength += Int.random(in: 20...30)
    bodyCondition.fatigue += Int.random(in: 10...20)
    bodyCondition.checkCurrentBodyCondition()
}
let longRun: Activity = Activity(name: "오래달리기") { (bodyCondition) in
    print("<<오래달리기를 시작합니다>>")
    bodyCondition.muscularEndurance += Int.random(in: 20...30)
    bodyCondition.upperBodyStrength += Int.random(in: 5...10)
    bodyCondition.lowerBodyStrength += Int.random(in: 5...10)
    bodyCondition.fatigue += Int.random(in: 20...30)
    bodyCondition.checkCurrentBodyCondition()
}
let activeRest: Activity = Activity(name: "동적휴식") { (bodyCondition) in
    print("<<동적휴식을 시작합니다>>")
    bodyCondition.fatigue -= Int.random(in: 5...10)
    bodyCondition.checkCurrentBodyCondition()
}

var hank: BodyCondition = BodyCondition(upperBodyStrength: 10, lowerBodyStrength: 15, muscularEndurance: 20, fatigue: 0)

sitUp.action(hank)
squat.action(hank)
longRun.action(hank)
activeRest.action(hank)

