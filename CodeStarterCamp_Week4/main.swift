//
//  main.swift
//  CodeStarterCamp_Week4
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

let misterKim = People.init(name: "김상훈", 
                            bodyCondition: BodyCondition(upperBodyStrength: 30,
                                                         lowerBodyStrength: 40,
                                                         muscularEndurance: 20,
                                                         fatigue: 40))

print(misterKim.workout(sitUp))
print(misterKim.workout(stretchRest))
print(misterKim.workout(squat))
print(misterKim.workout(stretchRest))
print(misterKim.workout(longRun))
print(misterKim.workout(stretchRest))
print(misterKim.conditionMessage)
