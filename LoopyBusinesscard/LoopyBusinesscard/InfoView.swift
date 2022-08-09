//
//  InfoView.swift
//  LoopyBusinesscard
//
//  Created by 효우 on 2022/08/09.
//

import SwiftUI

struct InfoView: View {
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(height: 50)
            .foregroundColor(Color.white)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .frame(width: 20, height: 20, alignment: .leading)
                        .foregroundColor(Color.pink)
                    Text(text)
                        .foregroundColor(Color.black)
                }
            )
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Hello", imageName: "phone.fill").previewLayout(.sizeThatFits)
    }
}
