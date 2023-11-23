//
//  PostView.swift
//  NiconeVitorKalil
//
//  Created by Vitor Kalil on 17/11/23.
//

import SwiftUI


class ImageCache {
    static let shared = ImageCache()

    private let cache = NSCache<NSString, UIImage>()

    private init() {}

    func set(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }

    func get(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
}

struct RemoteImage: View {
    @ObservedObject var imageLoader: ImageLoader

    init(url: String) {
        imageLoader = ImageLoader(url: url)
    }

    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
        } else {
            ProgressView()
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?

    private var url: String
    private var task: URLSessionDataTask?

    init(url: String) {
        self.url = url
        loadImage()
    }

    private func loadImage() {
        if let cachedImage = ImageCache.shared.get(forKey: url) {
            self.image = cachedImage
            return
        }

        guard let url = URL(string: url) else { return }

        task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }

            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.image = image
                ImageCache.shared.set(image!, forKey: self.url)
            }
        }
        task?.resume()
    }
}


struct PostView: View {
    @State var isLiked:Bool = false
    @State var isTagged:Bool = false
    @State var likesPost:Int = Int.random(in: 1..<400)
    var userName:String = "placeholder"
    var caption:String = "LOREM IPSUM ASHHAHSAHSHSSHahsah sahshash ahsahshahs aasahsahs"
    
    var postUrl:String = "https://vitorkalil.it/static/media/foto.b34f930a36c7697cb4b3.png"
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment:.center){
                /*AsyncImage(url: URL(string: postUrl)!){ image in
                    image.image?.resizable().aspectRatio(contentMode: .fill).frame(width:40,height:40).cornerRadius(30).padding(0)}*/
                RemoteImage(url: postUrl).aspectRatio(contentMode: .fill).frame(width:40,height:40).cornerRadius(30).padding(0).accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                Text(userName).padding(.bottom, 3.0).accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                Spacer()
                Image(systemName: "ellipsis").accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            }.padding(.horizontal,10)
            /*AsyncImage(url: URL(string: postUrl)!){ image in
                image.image?.resizable().aspectRatio(contentMode: .fit)}*/
            RemoteImage(url: postUrl).aspectRatio(contentMode: .fit)
            .padding(.top,10).accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            HStack(alignment:.center){
                Button(){ 
                    isLiked.toggle()
                    (isLiked ? (likesPost+=1):(likesPost-=1))
                }label:{Image(systemName: isLiked ? "heart.fill":"heart")
                        .resizable()
                        .foregroundColor(isLiked ? .red:.black)
                        .aspectRatio(contentMode: .fit)
                    .frame(width:25)}.accessibilityLabel("Like")
                Image(systemName: "message").resizable().aspectRatio(contentMode: .fit)
                    .frame(width:25).padding(.horizontal,10).accessibilityLabel("Comment this post")
                Image(systemName: "paperplane").resizable().aspectRatio(contentMode: .fit)
                    .frame(width:25).accessibilityLabel("Send this post to someone")
                Spacer()
                Button(){ isTagged = !isTagged }label:{
                    Image(systemName: isTagged ? "bookmark.fill":"bookmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.black)
                        .frame(width:15)}.accessibilityLabel("Mark this Post")
            }.padding(.horizontal,15).padding(.top,1.0)
            Text("\(likesPost) likes")
                .font(.footnote)
                .fontWeight(.semibold).padding(.top,10).padding(.horizontal,15)
            (Text(userName).fontWeight(.semibold) + Text(" ") + Text(caption).fontWeight(.regular))
                .font(.footnote)
                .fontWeight(.semibold).padding(.vertical,2).padding(.leading,15)
            Text("View all comments")
                .font(.footnote).foregroundColor(Color.gray).padding(.horizontal,15).accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            HStack(alignment:.center){
                /*AsyncImage(url: URL(string: postUrl)!){ image in
                    image.image?.resizable()
                    .aspectRatio(contentMode: .fill).frame(width:20,height:20).cornerRadius(20).padding(0)}*/
                RemoteImage(url: postUrl).aspectRatio(contentMode: .fill).frame(width:20,height:20).cornerRadius(20).padding(0).accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                Text("Add a comment...").font(.footnote).foregroundColor(Color.gray).padding(.bottom, 3.0)
                Spacer()
            }.padding(.horizontal,10).accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            Text("6 days ago")
                .font(.footnote).foregroundColor(Color.gray).padding(.horizontal,15).accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        }.padding(.vertical,15)
            .accessibilityElement(children: .contain)
            .accessibilityLabel("Post by\(userName). The post has \(likesPost) likes and you \(isLiked ? "already":"have not") liked it")
    }
        
}

#Preview {
    PostView()
}
/*
 class ImageCache {
     static let shared = ImageCache()

     private let cache = NSCache<NSString, UIImage>()

     private init() {}

     func set(_ image: UIImage, forKey key: String) {
         cache.setObject(image, forKey: key as NSString)
     }

     func get(forKey key: String) -> UIImage? {
         return cache.object(forKey: key as NSString)
     }
 }

 struct RemoteImage: View {
     @ObservedObject var imageLoader: ImageLoader

     init(url: String) {
         imageLoader = ImageLoader(url: url)
     }

     var body: some View {
         if let image = imageLoader.image {
             Image(uiImage: image)
                 .resizable()
         } else {
             ProgressView()
         }
     }
 }

 class ImageLoader: ObservableObject {
     @Published var image: UIImage?

     private var url: String
     private var task: URLSessionDataTask?

     init(url: String) {
         self.url = url
         loadImage()
     }

     private func loadImage() {
         if let cachedImage = ImageCache.shared.get(forKey: url) {
             self.image = cachedImage
             return
         }

         guard let url = URL(string: url) else { return }

         task = URLSession.shared.dataTask(with: url) { data, response, error in
             guard let data = data, error == nil else { return }

             DispatchQueue.main.async {
                 let image = UIImage(data: data)
                 self.image = image
                 ImageCache.shared.set(image!, forKey: self.url)
             }
         }
         task?.resume()
     }
 }
 */
