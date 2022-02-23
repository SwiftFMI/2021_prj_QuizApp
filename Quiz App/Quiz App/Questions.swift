//
//  Questions.swift
//  Quiz App
//
//  Created by Denislav's Mac Book on 23.02.22.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Questions: Identifiable,Codable {
    @DocumentID var id: String?
    var question: String?
    var optionA: String?
    var optionB: String?
    var optionC: String?
    var optionD: String?
    var answer: String?
    
    var isSubmitted = false
    var completed = false
    
    enum CodingKeys: String,CodingKey {
        case question
        case optionA = "a"
        case optionB = "b"
        case optionC = "c"
        case optionD = "d"
        case answer
    }
}
