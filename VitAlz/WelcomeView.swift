//
//  WelcomeView.swift
//  VitAlz
//
//  Created by Jonathan Wu on 2/17/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView{
            VStack{
                    
            }
            .navigationTitle("Vitamin and Nutritions")
            .toolbar{
                Button{
                    //label
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}
