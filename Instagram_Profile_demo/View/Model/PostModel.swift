//
//  PostModel.swift
//  Instagram_Profile_demo
//
//  Created by vignesh kumar c on 11/09/23.
//

import SwiftUI

struct Post: Identifiable {
  
    var id = UUID().uuidString
    var user: String
    var profile: String
    var postImage: String
    var postTitle: String
    var comments: String
    var time: String
}

var posts = [
    Post(user: "starcm", profile: "starc", postImage: "starc", postTitle: "bfhbferhgbe", comments: "view all comments", time: "12 min ago"),
    Post(user: "yuvis", profile: "yuvi", postImage: "yuvi", postTitle: "jehfbewfbhew", comments: "view all comments", time: "16min ago"),
    Post(user: "dadas", profile: "dada", postImage: "dada", postTitle: "hjdfbebe", comments: "view all comments", time: "23 min ago"),
    Post(user: "kaifs", profile: "kaif", postImage: "kaif", postTitle: "hdvberbf", comments: "view all comments", time: "30 min ago")]
