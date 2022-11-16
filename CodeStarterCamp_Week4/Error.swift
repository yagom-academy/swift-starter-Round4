import Foundation

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
