//
//  FeedView.swift
//  Instagram_Profile_demo
//
//  Created by vignesh kumar c on 11/09/23.
//

import SwiftUI

struct FeedView: View {
    
    @State var comments = ""
     
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Button {
                    
                } label: {
                        Text("Instagram")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                
                Spacer(minLength: 0)
                
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .font(.title)
                        .foregroundColor(.primary)
                }

                Button {
                    
                } label: {
                    Image(systemName: "message")
                        .font(.title)
                        .foregroundColor(.primary)
                }
            }
            .padding([.horizontal,.top])
            ScrollView(.vertical, showsIndicators: false) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        VStack {
                            Image("profile")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .padding(8)
                                .overlay(
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                        .padding(6)
                                        .background(Color.blue)
                                        .clipShape(Circle())
                                        .padding(2)
                                        .background(Color.white)
                                        .clipShape(Circle())
                                        .offset(x: 5, y: 5)
                                    ,alignment: .bottomTrailing)
                                .background(Circle().stroke(Color.red))
                            Text("Your Stroy")
                                .fontWeight(.semibold)
                        }
                        VStack {
                            Image("starc")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .padding(6)
                                .background(Circle().stroke(Color.red))
                            Text("Mstarc")
                                .fontWeight(.semibold)
                        }
                        VStack {
                            Image("yuvi")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .padding(8)
                                .background(Circle().stroke(Color.red))
                            Text("yuvi12")
                                .fontWeight(.semibold)
                        }
                        VStack {
                            Image("dada")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .padding(8)
                                .background(Circle().stroke(Color.red))
                            Text("Dada")
                                .fontWeight(.semibold)
                        }
                        
                    }
                    .padding([.top, .bottom], 8)
                }
                Divider()
                    .padding(.horizontal, -15)
                VStack(spacing: 25) {
                        ForEach(posts) { post in
                            PostCardView(post: post)
                        }
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

var rect = UIScreen.main.bounds
var edges = UIApplication.shared.windows.first?.safeAreaInsets

struct PostCardView: View {
    var post: Post
    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 15) {
                Image(post.profile)
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                
                Text(post.user)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(Color.primary)
                }


            }
            
            Image(post.postImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: rect.width - 30, height: 300)
                .cornerRadius(5)
            
            HStack(spacing: 15) {
                Button {
                    
                } label: {
                    Image(systemName: "suit.heart.fill")
                        .font(.system(size: 25))
                }
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .font(.system(size: 25))
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "bookmark")
                        .font(.system(size: 25))
                }

            }
            .foregroundColor(Color.primary)
            
            Text("31,999 likes")
                .padding([.top, .bottom], 0)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            (
                Text("\(post.user) ")
                    .fontWeight(.semibold)
                +
                Text(post.postTitle)
            )
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.top, .bottom], 0)
            Button {
                
            } label: {
                Text(post.comments)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 0)
                    .foregroundColor(Color.gray)
            }
            
            Text(post.time)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 0)
                .foregroundColor(Color.gray)

            
        }
        .padding()
    }
}
