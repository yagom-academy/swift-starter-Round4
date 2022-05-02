import Foundation

struct BodyCondition {
    var 상체근력: Int = 0
    var 하체근력: Int = 0
    var 근지구력: Int = 0
    var 피로도: Int = 0
}

struct Exercise {
    let name: String
    let action: (inout BodyCondition) -> Void
}
