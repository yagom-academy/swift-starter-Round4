//
//  Person.swift
//  CodeStarterCamp_Week4
//
//  Created by 맨태 on 1/25/24.
//

import Foundation

final class Person: BodyCondition {
    private var name: String
    private var weight: Int
    private var height: Int
    private var nationality: String
    
    init(name: String, weight: Int, height: Int, nationality: String) {
        self.name = name
        self.weight = weight
        self.height = height
        self.nationality = nationality
    }
    
    func visitHospital() {
        super.healedInjury()
    }
}

