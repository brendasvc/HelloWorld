//
//  ContentView.swift
//  HelloWorld
//
//  Created by Brenda Vega Contreras on 4/2/24.
//

import SwiftUI

struct RandomModel: Identifiable{
    let id=UUID().uuidString
    let title: String
}

struct ContentView: View {
    @State var selectedModel: RandomModel = RandomModel(title: "START")
    @State var showSheet1: Bool = false
    @State var showSheet2: Bool = false
    var body: some View {
        VStack(spacing: 30){
            Button("View Sheet 1"){
                showSheet1.toggle()
            }
            .sheet(isPresented: $showSheet1, content: {
                NextScreen(selectedModel: RandomModel(title: "HELLO WORLD ONE")){
                    self.showSheet1 = false
                }
                
            })
            Button("View Sheet 2"){
                showSheet2.toggle()
            }
            .sheet(isPresented: $showSheet2, content: {
                NextScreen(selectedModel: RandomModel(title: "HELLO WORLD TWO")){
                    self.showSheet2 = false
                }
                
            })
            
        }
        
    }
}

struct NextScreen: View{
    //@Environment(\.presentationMode) var presentationMode
    let selectedModel: RandomModel
    let dismiss: () -> Void
    
    var body: some View {
        Text(selectedModel.title)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        Button("Back to main menu"){
            dismiss()
            //self.presentationMode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    ContentView()
}
