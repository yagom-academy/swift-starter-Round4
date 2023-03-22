//
//  TextManager.swift
//  CodeStarterCamp_Week4
//
//  Created by redmango1446 on 2023/03/23.
//

import Foundation

struct TextManager {
    
    func checkInput(to letter: String?) throws -> (result: Bool, outputNumber: Int) {
        var result: Bool = true
        
        guard let input = letter, let inputNumber = Int(input), inputNumber > 0 else {
            throw RoutineError.inputError
        }
        
        if inputNumber > 5 {
            throw RoutineError.inputOverError
        }
        
        result = false
        return (result, inputNumber)
    }
    
    func printRoutineMessage(routineCount: Int, name: String) -> String {
        var message: String = ""
        let koreanSingleDigitNumber: [String] = ["첫", "두" , "세", "네", "다섯"]
        let i : Int = routineCount - 1
        
        message.append(koreanSingleDigitNumber[i])
        message.append("번째 \(name)을(를) 시작합니다")
        
        return message
    }
}
