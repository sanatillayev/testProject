//
//  ContentView.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 22/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var vm: HomeViewModel
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView {
                HomeView()
            }
            .tag(0)
            .tabItem {
                Text("Home")
                Image(systemName: "house")
            }
            
            NavigationView {
                BusinessView(vm: BusinessViewModel())
            }
            .tag(1)
            .tabItem {
                Text("Business")
                Image(systemName: "briefcase")
            }
            
            NavigationView {
                SportView(vm: SportViewModel())
            }
            .tag(2)
            .tabItem {
                Text("Sport")
                Image(systemName: "soccerball")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
        
    }
}
