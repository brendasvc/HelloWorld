//
//  ContentView.swift
//  HelloWorld
//
//  Created by Brenda Vega Contreras on 4/2/24.
//

import SwiftUI

// Define a model
struct RandomModel: Identifiable{
    let id=UUID().uuidString // Unique identifier
    let title: String // Title of the item
}

// Define the view of the main menu
struct ContentView: View {
    // State variables to track the selected model and sheet
    @State var selectedModel: RandomModel = RandomModel(title:"START")
    @State var showSheet1: Bool = false
    @State var showSheet2: Bool = false
    var body: some View {
        ZStack{
            Color.yellow // Background color of the main menu
            VStack(spacing: 30){
                // Text indicating the two options of buttons
                Text("SELECT SHEET TO VIEW:")
                    .font(.title)   // Font of the text
                // Button to go to sheet1
                Button("View Sheet 1"){
                    showSheet1.toggle()
                }
                .font(.title2) // Font of the text
                .background(Color(red: 0.8, green: 0.9, blue: 0.5)) // Set the background color of the button
                .sheet(isPresented: $showSheet1, content: {
                    ZStack{
                        Color.gray // Background color of sheet1
                        NextScreen(selectedModel: RandomModel(title: "HELLO WORLD ONE!")){
                            self.showSheet1 = false // Go back to main menu when dismiss is called
                        }
                    }
                    
                })
                // Button to go to sheet2
                Button("View Sheet 2"){
                    showSheet2.toggle()
                }
                .font(.title2) // Font of the text
                .background(Color(red: 0.8, green: 0.9, blue: 0.5)) // Set the background color of the button
                .sheet(isPresented: $showSheet2, content: {
                    ZStack{
                        Color.green // Background color of sheet2
                        NextScreen(selectedModel: RandomModel(title: "HELLO WORLD TWO!")){
                            self.showSheet2 = false // Go back to main menu when dismiss is called
                        }
                    }
                })
            }
        }
    }
}

// Define new sheet
struct NextScreen: View{
    let selectedModel: RandomModel // Model to display
    let dismiss: () -> Void // Dismiss current sheet
    
    var body: some View {
        VStack{
            Text(selectedModel.title) // Display text in current model
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/) // Set font of the title
            // Button to go back to main menu
            Button("Back to main menu"){
                dismiss()
            }
            .background(Color(red: 0.8, green: 0.9, blue: 0.5)) // Set background of the button to light green
        }
        .padding()
    }
}

//Preview of the app
#Preview {
    ContentView()
}
