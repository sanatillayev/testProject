//
//  iosTestApp.swift
//  iosTest
//
//  Created by Bilol Sanatillayev on 22/09/23.
//



import SwiftUI

@main
struct iosTestApp: App {
    
    @StateObject private var vm = HomeViewModel()
    @StateObject private var businessViewModel = BusinessViewModel()

    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(vm)
//            .environmentObject(businessViewModel)
        }
    }
}
