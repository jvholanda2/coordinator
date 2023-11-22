//
//  Coordinator.swift
//  Coordinator
//
//  Created by João Vitor Alves Holanda on 22/11/23.
//

import SwiftUI
import Foundation

protocol Coordinator: Identifiable, Hashable, AnyObject, ObservableObject {
  var path: NavigationPath { get set }

  func push<Flow: Hashable>(_ flow: Flow)
  func pop(_ k: Int)
  func popToRoot()
}

extension Hashable where Self: Identifiable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(self.id)
  }
}


// Extension para conformar com Hashable usando uma string como .rawValue
public extension RawRepresentable where Self: Hashable, Self: Identifiable, Self.RawValue == String {
    var id: Self.RawValue { self.rawValue }

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}




class LoginCoordinator: Coordinator {
    
    enum MyEnum: String, Hashable {
      case signIn
      case signUp
      case forgetPassword
      case cursos
    }
    
    func push<Flow>(_ flow: Flow) where Flow : Hashable {
        self.path.append(flow)
    }
    
    func pop(_ k: Int) {
        self.path.removeLast(k)
    }
    
    func popToRoot() {
        path = NavigationPath()
    }
    
    // Função de push específico
    func push(_ coordinate: MyEnum) {
      self.path.append(coordinate)
    }
    
    let id: UUID = UUID()

    @Published var path: NavigationPath

    init(path: NavigationPath = .init()) {
        self.path = path
    }

    func build() -> some View {
        LoginView(coordinator: self)
    }
}

// Enum de destinos (coordenadas)
extension LoginCoordinator {
    enum Coordinates: String, Hashable {
        case home
        case signUp
        case cursos
    }
}

extension LoginCoordinator {
    static func == (lhs: LoginCoordinator, rhs: LoginCoordinator) -> Bool {
        lhs.id == rhs.id
    }
}
