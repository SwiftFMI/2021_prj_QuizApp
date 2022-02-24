//
//  QA_View.swift
//  Quiz App
//
//  Created by Denislav's Mac Book on 22.02.22.
//

import SwiftUI

struct QA_View: View {
    //    @Binding var correct : Int
    //    @Binding var wrong : Int
    @Binding var answered: Int
    var set: String
    @StateObject var data = QuestionViewModel()
    var index:Int = 0
    @Binding var imageName: String
    
    
    var body: some View {
        ZStack{
            Color.yellow.ignoresSafeArea()
            if(data.questions.isEmpty){
                ProgressView {
                    Text("Loading")
                        .font(.title)
                }
            }
            else{
                QuestionView(answered: $answered, question: $data.questions[index], index:index, set:set, imageName: $imageName)
            }
        }
        .onAppear(perform: {
            data.getQuestions(set: set)
        })
        .navigationBarBackButtonHidden(true) 
    }
}
