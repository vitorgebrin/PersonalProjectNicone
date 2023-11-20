//
//  ContentView.swift
//  NiconeVitorKalil
//
//  Created by Vitor Kalil on 14/11/23.
//

import SwiftUI
import SwiftData
import Foundation



struct Response: Codable {
    let data: [Post]
}



struct ContentView: View {
    @State var resposta = "bb"
    
    var body: some View {
        
        VStack{
            
            HStack(){
                Image("Instagram_text").resizable().aspectRatio(contentMode: .fit)
                    .frame(width:200,height: 40,alignment: .leading)
                Spacer()
                Image(systemName: "heart").resizable().aspectRatio(contentMode: .fit)
                    .frame(width:25).padding(.horizontal,20)
                Image(systemName: "paperplane").resizable().aspectRatio(contentMode: .fit)
                    .frame(width:25)
            }.padding(.horizontal)
            
            ScrollView(showsIndicators: false){
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        Button(){}label:{StoriesView()}
                        Button(){}label:{StoriesView()}
                        Button(){}label:{StoriesView()}
                        Button(){}label:{StoriesView()}
                        Button(){}label:{StoriesView()}
                        Button(){}label:{StoriesView()}
                    }.padding(.horizontal)
                }.padding(.bottom, 5.0)
                VStack{
                    PostView()
                   PostView()
                   PostView()
                   PostView()
                   PostView()
                }
            }.padding(.bottom, 10.0)
            
           
            
            
        }.onAppear(perform: {
            parseJSON()
        })}
    
}
extension ContentView{
    func parseJSON() {
            guard let path = Bundle.main.path(forResource: "nicone", ofType: "json") else {
                print("\n-------> bundle path error")
                return
            }
            let url = URL(fileURLWithPath: path)
            
            do {
                let jsonData = try Data(contentsOf: url)
                let response = try JSONDecoder().decode(Response.self, from: jsonData)
                print("\n-------> response: \(response)")
                resposta = response.data[0].image_url
            }
            catch {
                print("\n====> error: \(error)" )
            }
            return
        }
}


#Preview {
    ContentView()
}
//Text(resposta)
/*AsyncImage(url: URL(string: "https://i.ytimg.com/vi/Cx6Nr882Xbg/maxresdefault.jpg")!){ image in
    image.image?.resizable().aspectRatio(contentMode: .fit)}*/
