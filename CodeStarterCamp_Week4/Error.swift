import Foundation

enum commonError: Error {
    case quit
    case containSpecialCharacter
    case containNumber
    case containNotNumber
}

enum InputChooseRoutinError: Error {
    case outOfRoutinRange
}

enum WhileExercisingError: Error {
    case overFatigue
    case unreachedTarget
}

func doesUserWantForcedQuit(_ input: String) -> Bool {
    if input == "q" || input == "'q'"{

        return true
    } else {

        return false
    }
}

func doesStringContainsSpecialCharacter(target: String) -> Bool {
    let letters = CharacterSet.punctuationCharacters
    let range = target.rangeOfCharacter(from: letters)
    if range != nil {

        return true
    } else {

        return false
    }
}

func doesStringContainsNumber(target: String) -> Bool {
    let letters = CharacterSet.decimalDigits
    let range = target.rangeOfCharacter(from: letters)
    if range != nil {

        return true
    } else {

        return false
    }
}

func doesStringContainsOnlyNumber(target: String) -> Bool {
    var array: [Bool] = []
    target.forEach { array.append($0.isNumber) }

    if array.contains(true) {
        return true
    } else {
        return false
    }
}

func doesInputNumberIsBetween(_ numberA: Int, and numberB: Int, inputNumber: Int) throws {
    if (inputNumber < numberA) || (inputNumber > numberB) {

        throw InputChooseRoutinError.outOfRoutinRange
    }
}

func checkExausted(member: Person) throws {
    if member.bodyCondition.fatigue >= 300 {

        throw WhileExercisingError.overFatigue
    }
}

func checkReachedTargetBodyCondition(who: Person, targetBodyCondition: BodyCondition?) throws {
    guard let targetUpperBodyStrength = targetBodyCondition?.upperBodyStrength,
          let targetLowerBodyStrength = targetBodyCondition?.lowerBodyStrength,
          let targetMuscleEndurance = targetBodyCondition?.muscleEndurance else { return }

    if who.bodyCondition.upperBodyStrength < targetUpperBodyStrength ||
        who.bodyCondition.lowerBodyStrength < targetLowerBodyStrength ||
        who.bodyCondition.muscleEndurance < targetMuscleEndurance {

        throw WhileExercisingError.unreachedTarget
    }
}
