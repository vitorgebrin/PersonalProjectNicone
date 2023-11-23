//
//  Post.swift
//  NiconeVitorKalil
//
//  Created by Vitor Kalil on 16/11/23.
//

import Foundation
 
struct Post:Codable,Identifiable {
    let id:String
    let username:String
    let timestamp:String
    let caption:String?
    let media_url:String
}
