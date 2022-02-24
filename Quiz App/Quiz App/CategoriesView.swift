//
//  CategoryView.swift
//  Quiz App
//
//  Created by Denislav's Mac Book on 22.02.22.
//

import SwiftUI

struct CategoryView: View {
    
    @State var isQATapped = false
    @State var answered = 0;
    
    var body: some View {
        VStack{
            Text("Quiz app")
                .font(.system(size: 38))
                .fontWeight(.heavy)
                .foregroundColor(.green)
                .padding(.top)
            Text("Choose category")
                .font(.title2)
                .foregroundColor(.black)
                .padding(.top, 8)
            Spacer(minLength: 0)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 15), count: 2)) {
                ForEach(1...4,id: \.self){index in
                    CategoryCellView(index: index)
                    
                    
                }
            }
            Spacer(minLength: 0)
        }
        .background(Color.yellow.ignoresSafeArea())
    }
}

struct CategoryCellView: View {
    @State private var isActive = false
    @State var answered = 0
    var index:Int
    let categories = ["Geography", "Films", "History", "Math"]
    var body: some View {
        VStack(){
            Image("category\(index)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 150)
            Text("\(categories[index - 1])")
                .padding()
        }
        .frame(width: 150)
        .padding()
        .border(Color.green, width: 7)
        .cornerRadius(15)
        .padding(.bottom)
        .background(
            NavigationLink (
                destination: SingleCategoryView(image:"category\(index)", set:categories[index - 1] ), isActive: $isActive,
                label: {
                    EmptyView()
                }
            ))
        .onTapGesture(count: 1, perform: {
            isActive = !isActive
        })
    }
}


struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
