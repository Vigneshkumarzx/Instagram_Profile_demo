//
//  Tabbar.swift
//  Instagram_Profile_demo
//
//  Created by vignesh kumar c on 11/09/23.
//

import SwiftUI

struct Tabbar: View {
    @State var selectedTab: String = "house.fill"
    
        init() {
            UITabBar.appearance().isHidden = true
        }
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tag("house.fill")
            Text("Search")
                .tag("magnifyingglass")
            Text("Add Media")
                .tag("plus.app")
            Text("Reels")
                .tag("reels")
            Profile()
                .tag("profile")
        }
        .overlay(
            VStack(spacing: 13) {
                Divider()
                    .padding(.horizontal, -15)
                
                HStack(spacing: 0) {
                    tabBarButton(image: "house.fill", isSystemImage: true, selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    tabBarButton(image: "magnifyingglass", isSystemImage: true, selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    tabBarButton(image: "plus.app", isSystemImage: true, selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    tabBarButton(image: "reels", isSystemImage: false, selectedTab: $selectedTab)
                        .frame(maxWidth: .infinity)
                    tabBarButton(image: "profile", isSystemImage: false, selectedTab: $selectedTab)
                        .clipShape(Circle())
                        .frame(maxWidth: .infinity)
                    
                }
            }
            .padding(.horizontal)
            .padding(.bottom, edges?.bottom ?? 15 )
            .background(scheme == .dark ? Color.black : Color.white)
            ,alignment: .bottom
        )
        .ignoresSafeArea()
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}

struct tabBarButton: View {
    var image: String
    var isSystemImage: Bool
    @Binding var selectedTab: String
    
    var body: some View {
        Button {
            selectedTab = image
        } label: {
            (
                isSystemImage ? Image(systemName: image) : Image(image)
            )
                .resizable()
                .aspectRatio(contentMode: .fill)
                .font(.title2)
                .foregroundColor(selectedTab == image ? .primary : .gray)
                .frame(width: 28, height: 28)
        }
    }
}
