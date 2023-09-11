//
//  Home.swift
//  Instagram_Profile_demo
//
//  Created by vignesh kumar c on 11/09/23.
//

import SwiftUI

struct Profile: View {
    
    @State  var selectedTab: String = "square.grid.3x3"
    @Namespace var animation
    
    @Environment(\.colorScheme) var scheme
    
    let posts = ["profile", "profile1", "profile2", "profile3", "profile4", "profile5", "profile6", "profile7", "profile8"]
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Button {
                    
                } label: {
                        Text("virat_Kholi")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                }
                
                Spacer(minLength: 0)
                
                Button {
                    
                } label: {
                    Image(systemName: "plus.app")
                        .font(.title)
                        .foregroundColor(.primary)
                }

                Button {
                    
                } label: {
                    Image(systemName: "line.horizontal.3")
                        .font(.title)
                        .foregroundColor(.primary)
                }
            }
            .padding([.horizontal,.top])
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Divider()
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Image("profile")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
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
                        }
                        
                        VStack {
                            Text("1648")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Text("Posts")
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack {
                            Text("258 M")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Text("Followers")
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)

                        VStack {
                            Text("288")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Text("Following")
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)
                      
                    }
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("VIrat Kohli")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        Text("Carpediem!")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        Link(destination: URL(string: "https://one8.com")!) {
                            Text("https://one8.com")
                            
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                    
                    //Professional dashBoard
                    
                    VStack(spacing: 10) {
                        Spacer()
                        Text("professional DashBoard")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.primary)
                            .padding(.horizontal, 10)
                        Text("100K accounts reached in the last 30 days")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.primary)
                            .padding(.horizontal, 10)
                        Spacer()
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundColor(Color.gray)
                    )
                    .padding([.horizontal, .top,])
                    
                    //Edit Profile
                    HStack(spacing: 10) {
                        Button {
                            
                        } label: {
                            Text("Edit profile")
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.gray)
                                )
                        }
                        
                        Button {
                            
                        } label: {
                            Text("Share profile")
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.gray)
                                )
                        }

                    }
                    .padding([.horizontal, .top])
                    
                    // Story section
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            Button {
                                
                            } label: {
                                VStack {
                                    Image(systemName: "plus")
                                        .font(.title2)
//                                        .fontWeight(.bold)
                                        .foregroundColor(.primary)
                                        .padding(18)
                                        .background(Circle().stroke(Color.gray))
                                    
                                    Text("New")
                                        .foregroundColor(Color.primary)
                                    
                                }
                            }

                        }
                        .padding()
                    }
                    
                    HStack(spacing: 0) {
                        TabBarItems(image: "square.grid.3x3", isSystemImage: true, animation: animation, selectedTab: $selectedTab)
                        TabBarItems(image: "reels", isSystemImage: false, animation: animation, selectedTab: $selectedTab)
                        TabBarItems(image: "person.crop.square.fill", isSystemImage: true, animation: animation, selectedTab: $selectedTab)
                    }
                    
                    .frame(height: 50, alignment: .bottom)
                    .background(scheme == .dark ? Color.black : Color.white)
                    
                    ZStack {
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 6), count: 3), spacing: 6) {
                            ForEach(posts, id: \.self) { index in
                                
                                GeometryReader { proxy in
                                    Image(index)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: proxy.frame(in: .global).width, height: 120)
                                        .cornerRadius(0)
                                }
                                .frame(height: 120)
                            }
                        }
                    }
                }
            }
            .padding(.bottom, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabBarItems: View {
    
    var image: String
    var isSystemImage: Bool
    var animation: Namespace.ID
    
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut) {
                selectedTab = image
            }
        }, label: {
            VStack(spacing: 12) {
                (
                    isSystemImage ? Image(systemName: image) : Image(image)
                )
                .renderingMode(.template)
                .resizable()
                .aspectRatio( contentMode: .fit)
                .frame(width: 28, height: 28)
                .foregroundColor(selectedTab == image ? .primary : .gray)
                
                ZStack {
                    if selectedTab == image {
                        Rectangle()
                            .fill(Color.primary)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    } else {
                        Rectangle()
                            .fill(Color.clear)
                    }
                }
                .frame(height: 1)
            }
        })
    }
}


