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

func checkInputHasCommonError(input: String, InputMustContainOnlyNumber: Bool) throws {
    if doesUserWantForcedQuit(input) {

        throw commonError.quit
    } else if doesStringContainsSpecialCharacter(target: input) {

        throw commonError.containSpecialCharacter
    } else if InputMustContainOnlyNumber {
        if !doesStringContainsOnlyNumber(target: input) {

            throw commonError.containNotNumber
        }
    } else if !InputMustContainOnlyNumber {
        if doesStringContainsNumber(target: input) {

            throw commonError.containNumber
        }
    }
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
    let onlyNumber: [Character] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    for character in target {
        if !onlyNumber.contains(character) {

            return false
        } else {

            return true
        }
    }

    return false
}

func doesInputNumberIsBetween(_ numberA: Int, and numberB: Int, inputNumber: Int) throws {
    if (inputNumber < numberA) || (inputNumber > numberB) {

        throw InputChooseRoutinError.outOfRoutinRange
    }
}

func checkExausted(member: Person) throws {
    if member.bodyCondition.fatigue > 300 {

        throw WhileExercisingError.overFatigue
    }
}

func checkReachedTargetBodyCondition(whose: Person, targetBodyCondition: BodyCondition?) throws {
    guard let targetUpperBodyStrength = targetBodyCondition?.upperBodyStrength,
          let targetLowerBodyStrength = targetBodyCondition?.lowerBodyStrength,
          let targetMuscleEndurance = targetBodyCondition?.muscleEndurance else { return }

    if whose.bodyCondition.upperBodyStrength < targetUpperBodyStrength ||
        whose.bodyCondition.lowerBodyStrength < targetLowerBodyStrength ||
        whose.bodyCondition.muscleEndurance < targetMuscleEndurance {

        throw WhileExercisingError.unreachedTarget
    }
}
