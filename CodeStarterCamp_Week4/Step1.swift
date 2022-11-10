import Foundation
class BodyCondition {
    var upperBodyStrength: Int
    var legStrength: Int
    var muscularEndurance: Int
    var tiredness: Int
    
    init(upperBodyStrength: Int, legStrength: Int, muscularEndurance: Int, tiredness: Int) {
        self.upperBodyStrength = upperBodyStrength
        self.legStrength = legStrength
        self.muscularEndurance = muscularEndurance
        self.tiredness = tiredness
    }
}

var bodyCondition = BodyCondition(upperBodyStrength: 40, legStrength: 40, muscularEndurance: 40, tiredness: 15)

struct Activity {
    var name: String
    
    let action: (BodyCondition) -> Void
}

enum ActivityType: String {
    case situp = "윗몸일으키기"
    case squart = "스쿼트"
    case running = "오래달리기"
    case dynamicRest = "동적휴식"
}

let situp: Activity = Activity(name: "윗몸일으키기", action: {(bodyCondtion) in
    var plusUpperBodyStrength = Int.random(in: 10...20)
    var plusTiredness = Int.random(in: 10...20)

    bodyCondition.upperBodyStrength += plusUpperBodyStrength
    bodyCondition.tiredness += plusTiredness
    
    print("<<\(situp.name)을(를) 시작합니다.>>")
    print("상체근력이 \(plusUpperBodyStrength) 상승합니다.")
    print("피로도가 \(plusTiredness) 상승합니다.")
    print("--------------")
})

let squart: Activity = Activity(name: "스쿼트", action: {(bodyCondition) in
    var plusLegStrength = Int.random(in: 20...30)
    var plusTiredness = Int.random(in: 10...20)
    
    bodyCondition.legStrength += plusLegStrength
    bodyCondition.tiredness += plusTiredness
    
    print("<<\(squart.name)을(를) 시작합니다.>>")
    print("하체근력이 \(plusLegStrength) 상승합니다.")
    print("피로도가 \(plusTiredness) 상승합니다.")
    print("--------------")
})

let running: Activity = Activity(name: "오래달리기", action: {(bodyCondition) in
    var plusUpperBodyStrength = Int.random(in: 5...10)
    var plusLegStrength = Int.random(in: 5...10)
    var plusTiredness = Int.random(in: 20...30)
    
    bodyCondition.upperBodyStrength += plusUpperBodyStrength
    bodyCondition.legStrength += plusLegStrength
    bodyCondition.tiredness += plusTiredness
    
    print("<<\(running.name)을(를) 시작합니다.>>")
    print("상체근력이 \(plusUpperBodyStrength) 상승합니다.")
    print("하체근력이 \(plusLegStrength) 상승합니다.")
    print("피로도가 \(plusTiredness) 상승합니다.")
    print("--------------")
    
})

let dynamicRest: Activity = Activity(name: "동적휴식", action: {(bodyCondition) in
    var minusTiredness = Int.random(in: 5...10)
    
    bodyCondition.tiredness -= minusTiredness
    
    print("<<\(dynamicRest.name)을(를) 시작합니다.>>")
    print("피로도가 \(minusTiredness) 감소합니다.")
    print("--------------")
})

func printCondtion() {
    print("""
        현재의 컨디션은 다음과 같습니다.
        상체근력: \(bodyCondition.upperBodyStrength)
        하체근력: \(bodyCondition.legStrength)
        근지구력: \(bodyCondition.muscularEndurance)
        피로도: \(bodyCondition.tiredness)
        --------------
        """)
}



func printResult(activity: Activity) {
    activity.action(bodyCondition)
    printCondtion()
}
