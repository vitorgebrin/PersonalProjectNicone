//
//  PostView.swift
//  NiconeVitorKalil
//
//  Created by Vitor Kalil on 17/11/23.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment:.center){
                AsyncImage(url: URL(string: "https://scontent.cdninstagram.com/v/t51.2885-19/332268024_6095995720451229_4851887019350547050_n.jpg?stp=dst-jpg_e0_s150x150&cb=efdfa7ed-2e54251b&efg=eyJxZV9ncm91cHMiOiJbXCJpZ19ianBnX3Byb2ZpbGVfcGljXzA3MDUtMFwiXSJ9&_nc_ht=scontent.cdninstagram.com&_nc_cat=1&_nc_ohc=IlHI3x2OrTwAX8sQFSp&edm=APs17CUBAAAA&ccb=7-5&oh=00_AfDbXFb1yHE7BZePafE1nl42RHNWPb8KiVeFiFrE06vi_A&oe=65595ED5&_nc_sid=10d13b")!){ image in
                    image.image?.resizable().aspectRatio(contentMode: .fit).frame(width:40).cornerRadius(30).padding(0)}
                Text("placeholder").padding(.bottom, 3.0)
                Spacer()
                Image(systemName: "ellipsis")
            }.padding(.horizontal,10)
            AsyncImage(url: URL(string: "https://scontent.cdninstagram.com/v/t51.2885-15/400037099_2323614781157066_8140699638827879756_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMDgweDEwODAuc2RyIn0&_nc_ht=scontent.cdninstagram.com&_nc_cat=102&_nc_ohc=8E8Vp5FY1FIAX-n1nmy&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzIzMDc3NzQ1NzIxNTM2OTgwNQ%3D%3D.2-ccb7-5&oh=00_AfCJAt0L8YrTauJosm2wlVQrxMFZe1nC8cGPjI7owJ5Xeg&oe=6558C347&_nc_sid=10d13b")!){ image in
                image.image?.resizable().aspectRatio(contentMode: .fit)}.padding(.top,10)
            HStack(alignment:.center){
                Image(systemName: "heart").resizable().aspectRatio(contentMode: .fit)
                    .frame(width:25)
                Image(systemName: "message").resizable().aspectRatio(contentMode: .fit)
                    .frame(width:25).padding(.horizontal,10)
                Image(systemName: "paperplane").resizable().aspectRatio(contentMode: .fit)
                    .frame(width:25)
                Spacer()
                Image(systemName: "bookmark").resizable().aspectRatio(contentMode: .fit)
                    .frame(width:15)
            }.padding(.horizontal,15).padding(.top,1.0)
            Text("1.000 likes")
                .font(.footnote)
                .fontWeight(.semibold).padding(.top,10).padding(.horizontal,15)
            (Text("Place Holder").fontWeight(.semibold) + Text(" ") + Text("LOREM IPSUM ASHHAHSAHSHSSHahsah sahshash ahsahshahs aasahsahs").fontWeight(.regular))
                .font(.footnote)
                .fontWeight(.semibold).padding(.vertical,2).padding(.leading,15)
            Text("View all comments")
                .font(.footnote).foregroundColor(Color.gray).padding(.horizontal,15)
            HStack(alignment:.center){
                AsyncImage(url: URL(string: "https://scontent.cdninstagram.com/v/t51.2885-19/332268024_6095995720451229_4851887019350547050_n.jpg?stp=dst-jpg_e0_s150x150&cb=efdfa7ed-2e54251b&efg=eyJxZV9ncm91cHMiOiJbXCJpZ19ianBnX3Byb2ZpbGVfcGljXzA3MDUtMFwiXSJ9&_nc_ht=scontent.cdninstagram.com&_nc_cat=1&_nc_ohc=IlHI3x2OrTwAX8sQFSp&edm=APs17CUBAAAA&ccb=7-5&oh=00_AfDbXFb1yHE7BZePafE1nl42RHNWPb8KiVeFiFrE06vi_A&oe=65595ED5&_nc_sid=10d13b")!){ image in
                    image.image?.resizable().aspectRatio(contentMode: .fit).frame(width:20).cornerRadius(20).padding(0)}
                Text("Add a comment...").font(.footnote).foregroundColor(Color.gray).padding(.bottom, 3.0)
                Spacer()
            }.padding(.horizontal,10)
            Text("6 days ago")
                .font(.footnote).foregroundColor(Color.gray).padding(.horizontal,15)
        }.padding(.vertical,15)
    }
}

#Preview {
    PostView()
}
//src="https://scontent.cdninstagram.com/v/t51.2885-19/332268024_6095995720451229_4851887019350547050_n.jpg?stp=dst-jpg_e0_s150x150&cb=efdfa7ed-2e54251b&efg=eyJxZV9ncm91cHMiOiJbXCJpZ19ianBnX3Byb2ZpbGVfcGljXzA3MDUtMFwiXSJ9&_nc_ht=scontent.cdninstagram.com&_nc_cat=1&_nc_ohc=IlHI3x2OrTwAX8sQFSp&edm=APs17CUBAAAA&ccb=7-5&oh=00_AfDbXFb1yHE7BZePafE1nl42RHNWPb8KiVeFiFrE06vi_A&oe=65595ED5&_nc_sid=10d13b"
