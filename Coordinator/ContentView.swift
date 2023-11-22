//
//  ContentView.swift
//  Coordinator
//
//  Created by João Vitor Alves Holanda on 22/11/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var coordinator: LoginCoordinator

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack {
                Button("Push to Home") {
                    coordinator.push(LoginCoordinator.Coordinates.home)
                }
                Button("Push to Sing Up") {
                    coordinator.push(LoginCoordinator.Coordinates.signUp)
                }
            }
            .navigationTitle("Login")
            .navigationDestination(for: LoginCoordinator.Coordinates.self) { coordinate in
                switch coordinate {
                case .home:
                    Home(coordinator: coordinator)
                case .signUp:
                    Text("Sign Up")
                case .cursos:
                    Cursos(coordinator: coordinator)
                }
            }
        }
    }
}

struct LoginViewPreview: PreviewProvider {
    static var previews: some View {
        LoginCoordinator().build()
    }
}
