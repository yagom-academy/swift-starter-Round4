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
    
    func pro(bodyCondition: BodyCondition) {
        activities[0].action(bodyCondition)
        activities[1].action(bodyCondition)
        activities[2].action(bodyCondition)
        activities[3].action(bodyCondition)
    }
}


func doRoutine(routine: Routine, bodyCondition: BodyCondition) throws {
    
    let countArray = ["첫", "두", "세", "네", "다섯","여섯", "일곱"]
        
        print("루틴을 몇 번 반복할까요?")
        let inputString = readLine()!
        
    
    guard inputString.allSatisfy({$0.isNumber}) else {
        throw RoutineError.inputError
    }
    
    let inputNumber = Int(inputString)!
    print("-------------")
        
    for number in 0..<inputNumber{
        print("\(countArray[number]) 번째 (을)를 시작합니다.")
        routine.intermediate(bodyCondition: bodyCondition)
        
        guard bodyCondition.tiredness <= 100 else {
            throw RoutineError.overTirednessError
        }
    }
    
    bodyCondition.printCondtion()
    
}

enum RoutineError: Error {
    case overTirednessError
    case inputError
}

func doRoutineWithCatchingError(routine: Routine, bodyCondition: BodyCondition) {
    do {
        try doRoutine(routine: routine, bodyCondition: bodyCondition)
    } catch RoutineError.overTirednessError {
        print("피로도가 100 이상입니다. 루틴을 중단합니다.")
        bodyCondition.printCondtion()
    } catch RoutineError.inputError {
        print("잘못된 입력 형식입니다. 다시 입력해주세요.")
    } catch {
        print("default error catch")
    }
}
