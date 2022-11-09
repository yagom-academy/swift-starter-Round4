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
    var name: String {
        willSet {
            print("<<\(name)을(를) 시작합니다.>>")
        }
    }
    let action: (BodyCondition) -> Void
}


let situp: Activity = Activity(name: "윗몸일으키기", action: {(bodyCondtion) in
    var plusUpperBodyStrength = Int.random(in: 10...20)
    var plusTiredness = Int.random(in: 10...20)

    bodyCondition.upperBodyStrength += plusUpperBodyStrength
    bodyCondition.tiredness += plusTiredness
    
    print("상체근력이 \(plusUpperBodyStrength) 상승합니다.")
    print("피로도가 \(plusTiredness) 상승합니다.")
    print("--------------")
})

let squart: Activity = Activity(name: "스쿼트", action: {(bodyCondition) in
    var plusLegStrength = Int.random(in: 20...30)
    var plusTiredness = Int.random(in: 10...20)
    
    bodyCondition.legStrength += plusLegStrength
    bodyCondition.tiredness += plusTiredness
    
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
    
    print("상체근력이 \(plusUpperBodyStrength) 상승합니다.")
    print("하체근력이 \(plusLegStrength) 상승합니다.")
    print("피로도가 \(plusTiredness) 상승합니다.")
    print("--------------")
    
})

let rest: Activity = Activity(name: "오래달리기", action: {(bodyCondition) in
    var minusTiredness = Int.random(in: 5...10)
    
    bodyCondition.tiredness -= minusTiredness
    
    print("피로도가 \(minusTiredness) 감소합니다.")
    print("--------------")
})



