import Foundation

struct Activity {
    var name: String
    let action: (BodyCondition) -> Void
}

let situp: Activity = Activity(name: "윗몸일으키기", action: { (bodyCondtion) in
    var plusUpperBodyStrength = Int.random(in: 10...20)
    var plusTiredness = Int.random(in: 10...20)

    bodyCondition.upperBodyStrength += plusUpperBodyStrength
    bodyCondition.tiredness += plusTiredness
    
    print("<<\(situp.name)을(를) 시작합니다.>>")
    print("상체근력이 \(plusUpperBodyStrength) 상승합니다.")
    print("피로도가 \(plusTiredness) 상승합니다.")
    print("--------------")
})

let squart: Activity = Activity(name: "스쿼트", action: { (bodyCondition) in
    var plusLegStrength = Int.random(in: 20...30)
    var plusTiredness = Int.random(in: 10...20)
    
    bodyCondition.legStrength += plusLegStrength
    bodyCondition.tiredness += plusTiredness
    
    print("<<\(squart.name)을(를) 시작합니다.>>")
    print("하체근력이 \(plusLegStrength) 상승합니다.")
    print("피로도가 \(plusTiredness) 상승합니다.")
    print("--------------")
})

let running: Activity = Activity(name: "오래달리기", action: { (bodyCondition) in
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

let dynamicRest: Activity = Activity(name: "동적휴식", action: { (bodyCondition) in
    var minusTiredness = Int.random(in: 5...10)
    
    bodyCondition.tiredness -= minusTiredness
    
    print("<<\(dynamicRest.name)을(를) 시작합니다.>>")
    print("피로도가 \(minusTiredness) 감소합니다.")
    print("--------------")
})

