//
//  ContentView.swift
//  TaskApp
//
//  Created by Mehmet Güler on 22.11.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab(Constants.todoString,systemImage:Constants.homeIconString ){
                Text("Ana Sayfa")
            }
            Tab(Constants.todoString,systemImage: Constants.todoIconString){
                TodosView()
            }
            Tab(Constants.todoString,systemImage: Constants.todoIconString){
                TodosView()
            }
            Tab(Constants.todoString,systemImage: Constants.todoIconString){
                TodosView()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
