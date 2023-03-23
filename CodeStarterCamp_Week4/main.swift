//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
import Foundation

let person: BodyCondition = BodyCondition(upperBodyStrengthValue: 0, lowerBodyStrengthValue: 0, muscularEnduranceValue: 0, fatigueLevelValue: 0)

performSitUps.perform()
performSitUps.action(person)
print("----------------")
person.showBodyCondition()
print("----------------")
