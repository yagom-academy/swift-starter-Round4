import Foundation


struct Routine {
    let activities: [Activity] = [situp, squart, running, dynamicRest]
    
    func novice(bodyCondition: BodyCondition) {
        activities[2].action(bodyCondition)//
        activities[3].action(bodyCondition)//
    }

    func intermediate(bodyCondition: BodyCondition) {
        activities[0].action(bodyCondition)
        activities[2].action(bodyCondition)
        activities[3].action(bodyCondition)
    }
    
    func senior(bodyCondition: BodyCondition) {
        activities[0].action(bodyCondition)
        activities[1].action(bodyCondition)
        activities[2].action(bodyCondition)
        activities[3].action(bodyCondition)
    }
}


func doRoutine(routine: Routine, bodyCondition: BodyCondition) throws {
    
    let countArray = ["첫", "두", "세", "네", "다섯","여섯", "일곱"]
    
    print("루틴을 몇 번 반복할까요?")
    guard let inputString = readLine() else {
        return
    }
    
    
    guard inputString.allSatisfy({ $0.isNumber }) else {
        throw RoutineError.inputError
    }
    
    guard let inputNumber = Int(inputString) else{
        print("입력값이 잘못되었습니다.")
        return
    }
    print("-------------")
    
    for number in 0..<inputNumber {
        print("\(countArray[number]) 번째 (을)를 시작합니다.")
        routine.intermediate(bodyCondition: bodyCondition)
        
        guard bodyCondition.tiredness <= 100 else {
            throw RoutineError.overTirednessError
        }
    }
    
    bodyCondition.printCondtion()
    
}



