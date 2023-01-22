//
//  PlayView.swift
//  lgd-mk2
//
//  Created by Angel Rincon on 11/1/22.
//

import SwiftUI

struct PlayView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var cardManager = CardManager()
    @State var imageName = "Next"
    @State var buttonDisabled = false

    var body: some View {
        
        ZStack {
            
            //Background image
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                Image(cardManager.imageName)
                    .resizable()
                    .cornerRadius(20)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: UIScreen.main.bounds.height * 0.6)
                
                Button {
                    if cardManager.lastImage {
                        buttonDisabled = true
                        cardManager.rollImage()
                        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { timer in
                            buttonDisabled = false
                            cardManager.lastImageReset()
                        }
                        imageName = cardManager.determinButtonLabel()
                    }
                    else {
                        cardManager.rollImage()
                        imageName = cardManager.determinButtonLabel()
                    }
                } label: {
                    Button1(name: imageName)
                }.disabled(buttonDisabled)
                    .opacity(buttonDisabled ? 0 : 1)
                    .offset(y: UIScreen.main.bounds.height * 0.05)
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            //Backbutton on toolbar
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
                    .onTapGesture {
                        self.presentation.wrappedValue.dismiss()
                    }
            }
            
            //Reset button on toolbar
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "gobackward")
                    .foregroundColor(.white)
                    .onTapGesture {
                        cardManager.reset()
                        imageName = "Next"
                    }
            }
            
        }
        
    }
    
}

struct Button1: View {
    
    let name: String
    
    var body : some View {
        Image("\(name)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: UIScreen.main.bounds.height * 0.08)
            
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
