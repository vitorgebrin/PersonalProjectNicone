//
//  StoriesView.swift
//  NiconeVitorKalil
//
//  Created by Vitor Kalil on 17/11/23.
//

import SwiftUI

struct StoriesView: View {
    var body: some View {
        VStack{
            Image("Face").resizable().aspectRatio(contentMode: .fit)
                .frame(width:90)
                .cornerRadius(45)
            Text("Name")
                .font(.footnote)
                .foregroundColor(Color.gray)
        }}
}

#Preview {
    StoriesView()
}
