//
//  StoriesView.swift
//  NiconeVitorKalil
//
//  Created by Vitor Kalil on 17/11/23.
//

import SwiftUI
// Here we have the color gradient that is applied on the Image on the overall View down there
struct CardGradient: View{
    var body: some View {
        Circle() // This is the shape of the border (could be a rectangle or any other form)
            .stroke(
                LinearGradient(
                    stops: [Gradient.Stop(color: Color(red: 1, green: 200/255, blue: 0), location: 0.1),
                            Gradient.Stop(color: Color(red: 1, green: 50/255, blue: 65/255), location: 0.5),
                            Gradient.Stop(color: Color(red: 1, green: 0, blue: 200/255), location: 0.8)
                           ],
                    startPoint: .bottomLeading,
                    endPoint: .topTrailing
                ),
                lineWidth: 4
            )
    }
}


struct StoriesView: View {
    var body: some View {
        VStack{
            Image("Face").resizable().aspectRatio(contentMode: .fit)
                .frame(width:90)
                .cornerRadius(45)
                .overlay(true ? CardGradient():nil) //here I apply the gradient as an overlay of the image
            Text("Name")
                .font(.footnote)
                .foregroundColor(Color.gray)
        }.padding(.top, 5.0)
        
    }
   
}

#Preview {
    StoriesView()
}
