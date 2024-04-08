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
        ZStack{
            Color.yellow
            VStack(spacing: 30){
                Text("SELECT SHEET TO VIEW:")
                    .font(.title)
                Button("View Sheet 1"){
                    showSheet1.toggle()
                }
                .font(.title2)
                .background(Color(red: 0.8, green: 0.9, blue: 0.5))
                .sheet(isPresented: $showSheet1, content: {
                    NextScreen(selectedModel: RandomModel(title: "HELLO WORLD ONE")){
                        self.showSheet1 = false
                    }
                    
                })
                Button("View Sheet 2"){
                    showSheet2.toggle()
                }
                .font(.title2)
                .background(Color(red: 0.8, green: 0.9, blue: 0.5))
                .sheet(isPresented: $showSheet2, content: {
                    NextScreen(selectedModel: RandomModel(title: "HELLO WORLD TWO")){
                        self.showSheet2 = false
                    }
                    
                })
            }
        }
        
    }
}

struct NextScreen: View{
    //@Environment(\.presentationMode) var presentationMode
    let selectedModel: RandomModel
    let dismiss: () -> Void
    
    var body: some View {
        VStack{
            Text(selectedModel.title)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Button("Back to main menu"){
                dismiss()
                //self.presentationMode.wrappedValue.dismiss()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
