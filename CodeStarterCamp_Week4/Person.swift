import Foundation

class Person {
    var name: String
    var bodyCondition: BodyCondition

    init(name: String, bodyCondition: BodyCondition) {
        self.name = name
        self.bodyCondition = bodyCondition
    }

    func exercise(routine: Routine, count: Int) {
        print(routine.routineOrder[count].name)
        routine.routineOrder[count].action(&bodyCondition)
    }
}
