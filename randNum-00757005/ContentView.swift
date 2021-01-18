//
//  ContentView.swift
//  randNum-00757005
//
//  Created by User15 on 2021/1/18.
//

import SwiftUI

struct ContentView: View {
    @State private var result : Int = 0
    @State private var food = ["丐幫滷味","八方雲集", "滿大碗", "麥當勞",
                               "築間", "すき家SUKIYA", "起家雞", "石二鍋"]
    @State private var showAlert = false
    
    var body: some View {
        ZStack{
            Text("現在該吃什麼好呢？")
                .font(.system(size: 30))
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .padding()
                .background(Color.yellow)
                .cornerRadius(20)
                .offset(x:0, y:-300)
            
            Image("bg")
                .resizable()
                .frame(width: 500, height: 300)
            
            ZStack{
                Image("\(result)")
                    .resizable()
                    .frame(width: 200, height: 150)
                    .cornerRadius(12)
                    .offset(x: 0, y: -300)
                
                Button(action:{
                    let randNum = 1...8
                    self.result = randNum.randomElement()!
                    self.showAlert = true
                }){
                    Text("咱們來吃！")
                        .font(.headline)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(30)
                        .foregroundColor(.black)
                        .padding(5)
                        .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.yellow, lineWidth: 5))
                }
            }
            .offset(x:0, y:300)
            .alert(isPresented: $showAlert) { () -> Alert in
                return Alert(title: Text("吃這個好了！"), message:Text(food[result-1]),dismissButton: .destructive(Text("OK"), action: {
                        print("OK")
                    }))
            }
        }
        .background(Color(red: 253/255, green: 232/255, blue: 205/255)
        .frame(width: 430, height: 950)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
