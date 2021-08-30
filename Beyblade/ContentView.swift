//
//  ContentView.swift
//  Beyblade
//
//  Created by André Santana on 30/08/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isRotated = false
    @State private var speed: Double = 0.0
    
    private func resetSpeed() {
        isRotated = false
        speed = 0.0
    }
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.white, .blue]), center: .center, startRadius: 20, endRadius: 600)
                .scaleEffect(1.2)
            VStack(spacing: 50) {
                Image("beyblade")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .rotationEffect(Angle(degrees: isRotated ? 36000 : 0))
                    .animation(Animation.easeInOut(duration: isRotated ? speed : 0).delay(0))

                VStack(spacing: 20) {
                    Button(action: {
                        speed = 100
                        isRotated.toggle()
                    }, label: {
                        ButtonTitleView(title: "Slown")

                    })
                    
                    Button(action: {
                        speed = 40
                        isRotated.toggle()
                    }, label: {
                        ButtonTitleView(title: "Fast")

                    })
                    
                    Button(action: {
                        speed = 20
                        isRotated.toggle()
                    }, label: {
                        ButtonTitleView(title: "Very Fast")
                    })
                }
                
                Button(action: {
                    resetSpeed()
                }, label: {
                    ButtonTitleView(title: "Stop")
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonTitleView: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(.white)
            .bold()
            .font(Font.system(size: 18))
            .frame(width: 120, height: 40)
            .background(title == "Stop" ? Color.red : Color.blue)
            .clipShape(Capsule())
    }
}
