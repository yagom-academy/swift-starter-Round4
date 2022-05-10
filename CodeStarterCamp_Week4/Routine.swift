import Foundation

struct Routine {
    var name: String
    var exercises = [Exercise]()
    
    init(name: String) {
        self.name = name
    }
    
    mutating func addExercise(exercise: Exercise) {
        self.exercises.append(exercise)
    }
    
}
