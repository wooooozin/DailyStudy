//
//  ContentView.swift
//  LoopyBusinesscard
//
//  Created by 효우 on 2022/08/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.91, green: 0.30, blue: 0.24)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("Loopy")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200.0, height: 200.0, alignment: .center)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color(red: 0.91, green: 0.30, blue: 0.24, opacity: 0.5),lineWidth: 5)
                    )
                Text("ZanMang Loopy")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                InfoView(text: "010-1234-1234", imageName: "phone.fill")
                InfoView(text: "Loopy@zangmang.com", imageName: "envelope.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
