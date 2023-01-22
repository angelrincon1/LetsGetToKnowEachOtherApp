//
//  RulesView.swift
//  lgd-mk2
//
//  Created by Angel Rincon on 11/1/22.
//

import SwiftUI

struct RulesView: View {
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        Image("rules")
            .resizable()
            .ignoresSafeArea()
            .aspectRatio(contentMode: .fill)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                        .onTapGesture {
                            self.presentation.wrappedValue.dismiss()
                        }
                }
            }
    }
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
    }
}
