//
//  QuestionView.swift
//  Quiz App
//
//  Created by Denislav's Mac Book on 24.02.22.
//

import SwiftUI

struct QuestionView: View {
    @Binding var answered: Int
    @Binding var question: Questions
    @State var index:Int
    @StateObject var data = QuestionViewModel()
    @State var set: String
    @State var selected = ""
    
    
    var body: some View {
        VStack{
            Spacer(minLength: 0)
            Text("Question \(index + 1)")
                .font(.title)
                .foregroundColor(.green)
                .fontWeight(.bold)
            Spacer(minLength: 0)
            Text(question.question!)
                .font(.title)
                .foregroundColor(.black)
                .padding()
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 20), count: 2)) {
                Button(question.optionA!) {
                    selected = question.optionA!
                }
                .frame(width: 150, height: 40, alignment: .center)
                .padding()
                .background(color(option: question.optionA!))
                .foregroundColor(colorText(option: question.optionA!))
                .border(colorBorder(option: question.optionA!), width: 3)
                Button(question.optionB!) {
                    selected = question.optionB!
                }
                .frame(width: 150, height: 40, alignment: .center)
                .padding()
                .background(color(option: question.optionB!))
                .foregroundColor(colorText(option: question.optionB!))
                .border(colorBorder(option: question.optionB!), width: 3)
                Button(question.optionC!) {
                    selected = question.optionC!
                }
                .frame(width: 150, height: 40, alignment: .center)
                .padding()
                .background(color(option: question.optionC!))
                .foregroundColor(colorText(option: question.optionC!))
                .border(colorBorder(option: question.optionC!), width: 3)
                Button(question.optionD!) {
                    selected = question.optionD!
                }
                .frame(width: 150, height: 40, alignment: .center)
                .padding()
                .background(color(option: question.optionD!))
                .foregroundColor(colorText(option: question.optionD!))
                .border(colorBorder(option: question.optionD!), width: 3)
                
            }
            .padding()
            Spacer(minLength: 0)
        }
        .onAppear(perform: {
            data.getQuestions(set: set)
        })
    }
    func color(option: String)->Color{
        if selected == option && option == question.answer!{
            return Color.green
        }
        if selected == option && option != question.answer!{
            return Color.red
        }else{
            return Color.clear
        }
    }
    func colorText(option: String)->Color{
        if selected == option {
            return Color.white
        }else{
            return Color.black
        }
    }
    func colorBorder(option: String)->Color{
        if selected == option && option != question.answer!{
            return Color.red
        }else {
            return Color.green
        }
    }
}
