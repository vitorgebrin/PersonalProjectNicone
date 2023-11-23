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
    @State private var resposta:Response?
    
    var body: some View {
        
        VStack{
            
            HStack(){
                
                Image("tatagram_text")
                        .resizable().aspectRatio(contentMode: .fit)
                        .frame(width:200,height: 40,alignment: .leading)
                        .accessibilityLabel(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/).accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
                Spacer()
                    
            Button{}label:{Image(systemName: "heart").resizable().aspectRatio(contentMode: .fit)
                    .frame(width:25).padding(.horizontal,16).foregroundColor(.black)
            }.accessibilityAddTraits([.isButton])
                    .accessibilityLabel("Activity")
                Button{}label:{
                    Image(systemName: "paperplane").resizable().aspectRatio(contentMode: .fit)
                    .frame(width:25).foregroundColor(.black)}
                .accessibilityAddTraits([.isButton])
                        .accessibilityLabel("Direct Messages")
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
                }
                .accessibilityElement(children: .contain)
                .accessibilitySortPriority(/*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .accessibilityHint("Swipe up or down to adjust the value")
                    .accessibilityLabel("Stories Tray")
                    
                VStack{
                    ForEach(resposta?.data ?? [Post(id: "0", username: "niente", timestamp: "none", caption: "none", media_url: "https://vitorkalil.it/static/media/foto.b34f930a36c7697cb4b3.png")]){post in
                        PostView(userName:post.username,caption:post.caption ?? "default", postUrl:post.media_url)
                    }
                    .accessibilityElement(children: .contain)
                    .accessibilityLabel("App Feed")
                        
                }
            }.padding(.bottom, 10.0)
            
           
            
            
        }.task {
            await parseJSON()
        }}
    
}
extension ContentView{
    func parseJSON() async {
        /*
            guard let path = Bundle.main.path(forResource: "nicone", ofType: "json") else {
                print("\n-------> bundle path error")
                return
            }
            let url = URL(fileURLWithPath: path)
            */
        let accessToken = ""
        let urlString = "https://graph.instagram.com/me/media?fields=id,media_type,media_url,username,timestamp,caption&access_token=" + accessToken
        guard let url = URL(string: urlString) else{
            print("URL Invalido")
            return
        }
        do{
            //let retorna um tuple com a data e a meta data, que a gente nao se importa
            let (jsonData,_ ) = try await URLSession.shared.data(from: url)
            if let response = try? JSONDecoder().decode(Response.self, from: jsonData){
                resposta = response
            }
        } catch {
            print("dados invalidos")
        }
   
        }
    
}


#Preview {
    ContentView()
}
//Text(resposta)
/*AsyncImage(url: URL(string: "https://i.ytimg.com/vi/Cx6Nr882Xbg/maxresdefault.jpg")!){ image in
    image.image?.resizable().aspectRatio(contentMode: .fit)}*/
/*
   let url = URL(string: urlString)
    do {
        let jsonData = try Data(contentsOf: url!)
        let response = try JSONDecoder().decode(Response.self, from: jsonData)
        print("\n-------> response: \(response)")
        resposta = response
    }
    catch {
        print("\n====> error: \(error)" )
    }
    return*/
