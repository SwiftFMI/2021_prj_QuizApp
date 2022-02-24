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
            Button(action: {isOpen = !isOpen}, label: {
                Text("Start Quiz")
            })
            .padding(.top, 150)
            .font(.largeTitle)
            .background(
                NavigationLink (
                    destination: QA_View(answered: $answered, set:set ), isActive: $isOpen,
                    label: {
                        EmptyView()
                    }
                ))
            Spacer(minLength: 0)
        }
        .frame(width: 700)
        .background(Color.yellow.ignoresSafeArea())
    }
}
