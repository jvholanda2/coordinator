//
//  Cursos.swift
//  Coordinator
//
//  Created by João Vitor Alves Holanda on 22/11/23.
//

import SwiftUI

struct Cursos: View {
    @ObservedObject var coordinator: LoginCoordinator
    var body: some View {
        Text("Cursos")
    }
}

#Preview {
    Cursos(coordinator: .init())
}
