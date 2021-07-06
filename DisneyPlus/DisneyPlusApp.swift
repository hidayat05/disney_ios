//
//  DisneyPlusApp.swift
//  DisneyPlus
//
//  Created by User on 06/07/21.
//

import SwiftUI

@main
struct DisneyPlusApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(HomeViewModel())
        }
    }
}
