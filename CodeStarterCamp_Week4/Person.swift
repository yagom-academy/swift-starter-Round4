import Foundation

class Person: BodyCondition {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        super.init(상체근력: 0, 하체근력: 0, 근지구력: 0, 피로도: 0)
    }
}
