//
//  ContentView.swift
//  lgd-mk2
//
//  Created by Angel Rincon on 11/1/22.
//

import SwiftUI

struct ContentView: View {
                
    var body: some View {
        
        NavigationView {
            ZStack {
                GeometryReader { geo in
                    VStack(alignment: .center, spacing: 20) {
                        
                        NavigationLink(destination: PlayView()) {
                            Image("Start")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geo.size.width * 0.6)
                        }
                        
                        NavigationLink(destination: RulesView()) {
                            Image("RulesButton")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geo.size.width * 0.6)
                        }
                    }.frame(width: geo.size.width, height: geo.size.height)
                    
                    Link(destination: URL(string: "https://www.instagram.com/letsmakehappymemories")!) {
                        Image("instagram-icon")
                            .resizable()
                            .colorInvert()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width * 0.12)
                    }
                    .padding([.bottom, .trailing], 30)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                }
            }
            .background(
                Image("mainScreenBackground")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
            )
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
