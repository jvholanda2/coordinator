//
//  CoordinatorApp.swift
//  Coordinator
//
//  Created by João Vitor Alves Holanda on 22/11/23.
//

import SwiftUI

@main
struct FlowApp: App {
    @StateObject var coordinator = LoginCoordinator()

    var body: some Scene {
        WindowGroup {
            coordinator.build()
        }
    }
}
