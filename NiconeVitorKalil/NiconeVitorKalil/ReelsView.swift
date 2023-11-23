//
//  StoriesView.swift
//  NiconeVitorKalil
//
//  Created by Vitor Kalil on 17/11/23.
// Color(red:1,green:1,blue:1,alpha:0.5)

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
                lineWidth: 3
            )
    }
}


struct StoriesView: View {
    @State var isSeen:Bool = false
    var name:String = ["Gisele","Pasquale","Gianluca","Tiago","Santo","Emanuele","Maria","Luca","Flora","Francesco","Domenico","Roberta","Dylan","Valentina","Bruno","Roger","Maurice","Simba","George","Lautaro","Claudia","Francesca","Federica","Ferdinando","Bartolomeo","Davide","David"][Int.random(in: 0..<24)]
    var body: some View {
        Button(){ isSeen = true }label:{
            VStack{
                Image("Face").resizable().aspectRatio(contentMode: .fit)
                    .frame(width:88)
                    .cornerRadius(44)
                    .overlay(isSeen ? nil:CardGradient()) //here I apply the gradient as an overlay of the image
                Text(name)
                    .font(.footnote)
                    .foregroundColor(isSeen ? Color.gray :Color.black).padding(.top,1)
            }.padding(.top, 5.0)
                .padding(.trailing,12)
            
        }
        .accessibilityLabel("Stories of \(name)")}
   
}

#Preview {
    StoriesView()
}
