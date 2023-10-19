//
//  ContentView.swift
//  SwiftUILoginDemo
//
//  Created by Neosoft on 19/10/23.
//

import SwiftUI

struct ContentView: View {
    @State var username = ""
    @State var password = ""
    @State var showAlert:Bool = false
    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, -100.0)
            TextFieldsView(lblText: "UserName", placeHolder: "Enter UserName", textFieldText: $username)
            TextFieldsView(lblText: "Password", placeHolder: "Enter Password", textFieldText: $password)
            Button(action: {
              self.showAlert = true
            }) {
                Text("Submit").foregroundColor(.white)
                    .padding(.all, 10.0)
            }
            .background(.black).cornerRadius(10)
            .padding(.top, 50.0)
            .alert(isPresented: self.$showAlert) {
              Alert(title: Text("Login Hogaya"), message: Text("Aisa Boluga socha thana"))
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TextFieldsView: View {
    var lblText:String
    var placeHolder:String
    @Binding var textFieldText:String
    var body: some View {
        HStack{
            Text(lblText)
                .padding(.leading, 30.0).frame(width: 150)
            TextField(placeHolder, text: $textFieldText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.trailing, 30.0)
        }.padding()
    }
}
