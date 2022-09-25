//
//  ContentView.swift
//  TaskMamoon
//
//  Created by murad adnan on 23/09/2022.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @State private var isShowingCreateQuestion: Bool = false
    
    var body: some View {
        VStack (alignment: .leading){
            CustomHeader(largeHeader: false,tittleHeader: "Demo Mamoon")
            
            HStack {
                
                Text("-GENERAL").foregroundColor(Color.gray)
                Spacer()
                    Text("0/1").foregroundColor(Color.white)
                 .frame(width: 100, height: 30)
                .background(Color.gray)
                .cornerRadius(5)
                .padding(.trailing, 5)
            
               
            }.padding(.leading)
            
            CardViewQuestion(question: "123").frame(height: 230)
            Spacer()
            HStack(spacing:10) {
                
                Button(action: {
//                        self.callback(opportunityModels,0)
                    isShowingCreateQuestion = true
                }, label: {
                    Image(systemName:"square.and.pencil")
                        .resizable()
                           .scaledToFit()
                           .padding(-4)
                           .frame(height: 50)
                           .foregroundColor(.green)
                })
                
            }
            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 50, maxHeight: 100)
            .sheet(isPresented: $isShowingCreateQuestion) {
//                FailterView(title: "Filter",filterModel: filterModel,callback: confirmFilter)

            }

                
            
          
        }.background( Color.gray
            .brightness(0.4))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
