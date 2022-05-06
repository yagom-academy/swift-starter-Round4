//
//  hangeul.swift
//  CodeStarterCamp_Week4
//
//  Created by 이정민 on 2022/05/06.
//

import Foundation


func deFramentation(_ pieces: String) -> String {
    var collect: [String] = [String(pieces[pieces.startIndex]), String(pieces[pieces.index(pieces.startIndex, offsetBy: 1)])]
    var storage: [[String]] = []
    var preCharacter: String = String(pieces[pieces.index(pieces.startIndex, offsetBy: 2)])
    
    for i in 3..<pieces.count {
        let piece = String(pieces[pieces.index(pieces.startIndex, offsetBy: i)])
        
        if consonant.contains(piece) {
            if consonant.contains(preCharacter) {
                collect.append(preCharacter)
                storage.append(collect)
                preCharacter = ""
                collect = []
            }
        } else if vowel.contains(piece) {
            if collect != [] {
                storage.append(collect)
                collect = []
            }
        }
        
        if preCharacter != "" {
            collect.append(preCharacter)
        }
        preCharacter = piece
    }
    
    collect.append(preCharacter)
    storage.append(collect)
    
    var result = ""
    for hangeul in storage {
        result += hangeulDictionary[hangeul] ?? "?"
    }
    return result
}

let vowel: [String] = ["ㅏ", "ㅐ", "ㅑ", "ㅓ", "ㅔ", "ㅕ", "ㅗ", "ㅛ", "ㅜ", "ㅠ", "ㅡ", "ㅣ"]
let consonant: [String] = ["ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅁ", "ㅂ", "ㅅ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"]

let hangeulDictionary: [[String] : String] = [
    ["ㅇ","ㅣ"] : "이",
    ["ㅈ","ㅓ","ㅇ"] : "정",
    ["ㅁ","ㅣ","ㄴ"] : "민",
    ["ㄱ","ㅣ","ㅁ"] : "김",
    ["ㅊ","ㅓ","ㄹ"] : "철",
    ["ㅅ","ㅜ"] : "수"
]
