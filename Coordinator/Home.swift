//
//  Home.swift
//  Coordinator
//
//  Created by João Vitor Alves Holanda on 22/11/23.
//

import SwiftUI

struct Home: View {
    @ObservedObject var coordinator: LoginCoordinator
    
    var body: some View {
        VStack {
            Text("Home")
            Button("Vai para cursos") {
                coordinator.push(LoginCoordinator.Coordinates.cursos)
            }
        }.navigationDestination(for: LoginCoordinator.Coordinates.self) {  coordinate in
            if coordinate.rawValue == "cursos" {
                Cursos(coordinator: coordinator)
            }
        }
    }
}

#Preview {
    Home(coordinator: .init())
}
