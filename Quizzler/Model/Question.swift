//
//  Question.swift
//  Quizzler
//
//  Created by Rahul Krishnan on 6/5/19.
//  Copyright © 2019 Rahul Krishnan. All rights reserved.
//

import Foundation

class Question {
    
    let questionText : String
    let answer : Bool
    
    init(text : String, correctAnswer : Bool) {
        
        questionText = text
        answer = correctAnswer
        
    }
}
