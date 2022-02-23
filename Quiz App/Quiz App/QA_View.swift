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
    
    
    var body: some View {
        VStack{
            Spacer(minLength: 0)
            Text("Question №1")
                .font(.title)
                .foregroundColor(.green)
                .fontWeight(.bold)
            Spacer(minLength: 0)
            Text("What is the capital of England?")
                .font(.title)
                .foregroundColor(.black)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 20), count: 2)) {
                ForEach(1...4,id: \.self){index in
                    Button("Answer \(index)") {
                        
                    }
                    .frame(width: 150, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color.clear)
                    .foregroundColor(.black)
                    .border(Color.green, width: 3)
                }
                .padding(.bottom)
                
            }
            .padding()
            Spacer(minLength: 0)
        }
        .background(Color.yellow.ignoresSafeArea())
        .onAppear(perform: {
            data.getQuestions(set: set)
        })
    }
}
