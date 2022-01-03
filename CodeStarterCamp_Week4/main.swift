import Foundation

class BodyCondition {
    var upperBodyStrength: Int = 0
    var lowerBodyStrength: Int = 0
    var muscularEndurance: Int = 0
    var muscleFatigue: Int = 0
}

struct Exercise {
    let name: String
    let action: () -> Void
}

struct Routine {
    let name: String
    let exercises: [Exercise]
}


