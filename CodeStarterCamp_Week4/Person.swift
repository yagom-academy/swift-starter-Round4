import Foundation

struct Person {
    var name: String
    var bodyCondition: BodyCondition

    mutating func exercise(routine: Routine, count: Int) {
        print(routine.routineOrder[count].name)
        routine.routineOrder[count].action(&bodyCondition)
    }
}
