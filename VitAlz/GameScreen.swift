//
//  GameScreen.swift
//  VitAlz
//
//  Created by Justin Chung on 2/18/24.
//

import SwiftUI
import UIKit

struct GameScreen: View {
    var body: some View {
        GameViewControllerRepresentable().edgesIgnoringSafeArea(.all)
    }
}

struct GameViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) ->  UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "Home")
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}
