//
//  SingleCategoryView.swift
//  Quiz App
//
//  Created by Denislav's Mac Book on 24.02.22.
//

import SwiftUI

struct SingleCategoryView: View {
    @State var answered = 0
    @State var image:String
    var set: String
    @State private var isOpen = false
    @State private var isHome = false
    @StateObject var data = QuestionViewModel()
    var body: some View {
        VStack{
            Spacer(minLength: 0)
            Text(set)
                .font(.largeTitle)
                .padding()
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
                .padding()
            Text("\(answered)/\(data.questions.count)")
            Button(action: {isOpen = !isOpen; answered = 0}, label: {
                Text("Start Quiz")
            })
            .padding(.top, 150)
            .font(.largeTitle)
            .background(
                NavigationLink (
                    destination: QA_View(answered: $answered, set:set, imageName: $image ), isActive: $isOpen,
                    label: {
                        EmptyView()
                    }
                ))
            Spacer(minLength: 0)
            Button(action: {isHome = !isHome; answered = 0}, label: {
                Text("Go to categories")
            })
            .padding(.top, 150)
            .font(.largeTitle)
            .background(
                NavigationLink (
                    destination: CategoryView(), isActive: $isHome,
                    label: {
                        EmptyView()
                    }
                ))
            Spacer(minLength: 0)
        }
        .frame(width: 700)
        .background(Color.yellow.ignoresSafeArea())
        .onAppear(perform: {
            data.getQuestions(set: set)
        })
        .navigationBarBackButtonHidden(true) 
    }
}
