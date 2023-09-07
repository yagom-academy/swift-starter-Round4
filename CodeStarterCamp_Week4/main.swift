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

print(misterKim.workout(of: sitUp))
print(misterKim.workout(of: stretchRest))
print(misterKim.workout(of: squat))
print(misterKim.workout(of: stretchRest))
print(misterKim.workout(of: longRun))
print(misterKim.workout(of: stretchRest))
print(misterKim.contidionMessage)
