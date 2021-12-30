//  main.swift
//  CodeStarterCamp_Week4
//  Created by quokka.
//  Copyright © yagom academy. All rights reserved.

import Foundation

class BodyCondition {
    var uppperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    init(uppperBodyStrength: Int, lowerBodyStrength: Int, muscularEndurance: Int, fatigue: Int) {
        self.uppperBodyStrength = uppperBodyStrength
        self.lowerBodyStrength = lowerBodyStrength
        self.muscularEndurance = muscularEndurance
        self.fatigue = fatigue
    }
    
    func sitUp() {
        self.uppperBodyStrength += Int.random(in: 10...20)
        self.fatigue += Int.random(in: 10...20)
    }
    
    func moveSquat() {
        self.lowerBodyStrength += Int.random(in: 20...30)
        self.fatigue += Int.random(in: 10...20)
    }
    
    func runLong() {
        self.muscularEndurance += Int.random(in: 20...30)
        self.uppperBodyStrength += Int.random(in: 5...10)
        self.lowerBodyStrength += Int.random(in: 5...10)
        self.fatigue += Int.random(in: 20...30)
    }
    
    func moveActiveRest() {
        self.fatigue -= Int.random(in: 5...10)
    }
    
    func pushUp() {
        self.uppperBodyStrength += Int.random(in: 10...15)
        self.fatigue += Int.random(in: 5...10)
    }
}

struct Exercise {
    let name: String
    var action: () -> Self
}

struct Routine {
    let name: String
    let exercises: [() -> Exercise]
}
