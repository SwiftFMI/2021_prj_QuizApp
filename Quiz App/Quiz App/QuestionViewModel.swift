//
//  QuestionViewModel.swift
//  Quiz App
//
//  Created by Denislav's Mac Book on 23.02.22.
//

import SwiftUI
import Firebase

class QuestionViewModel: ObservableObject {
    @Published var questions : [Questions] = []
    
    func getQuestions(set: String){
        let db = Firestore.firestore()
        
        db.collection("Geography").getDocuments {
            (snap, err) in
            guard let data = snap else {return}
            
            DispatchQueue.main.async {
                self.questions = data.documents.compactMap({ (doc) -> Questions? in return try? doc.data(as: Questions.self)})
            }
        }
    }
}
