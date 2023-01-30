//
//  ContentView.swift
//  Anime
//
//  Created by Kinder on 23/12/2021.
//

import SwiftUI
import WebKit
import AVFoundation




struct ContentView: View {
    @State private var din = false
    @State private var angle: Double = 0
    @State private var scale: CGFloat = 1
    class music
    {
    public static var backgrndSound: AVAudioPlayer?

    // AVAudioPlayer already has an isPlaying property
  class func isMusicPlaying() -> Bool
    {
       return backgrndSound?.isPlaying ?? false
    }
    
    class func StartPlaying()
    {
        let path = Bundle.main.path(forResource: "dd.mp3", ofType: nil)!
       let url = URL(fileURLWithPath: path)
       do
       {
          backgrndSound = try AVAudioPlayer(contentsOf: url)
          backgrndSound?.numberOfLoops = 20
          backgrndSound?.play()
       }
       catch
       {
          // couldn't load file :(
       }
    }
    }
    var body: some View {
        
        VStack {
        
            HStack {
  
                VStack{
                          ZStack{
                              
                              
                              Rectangle()
                                  .opacity(-1)
                        Button(action:  {music.StartPlaying()
                            
                            
                            self.din = true; self.angle += 360}) {
                       Image("4")
                     
                                .resizable()
                                .padding(.top, 21)
                                .frame(width: 260, height: 250)
                                .shadow(color: Color(hue: 0.474, saturation: 0.563, brightness: 0.911, opacity: 0.52), radius: -0.7, x: 1, y: 1)
                                .shadow(color: Color(hue: 1.0, saturation: 0.461, brightness: 0.933, opacity: 0.537), radius: 0.1, x: -1, y: -1)
                                .blur(radius: 1)
                                .background(.black)
                      
                        }
                        .padding(.all, 2)
                    
                        
                            .rotationEffect(.degrees(angle))
                            
                            .animation(.interpolatingSpring (mass : 1, stiffness : 1, damping : 99, initialVelocity : 0.2), value: angle)
                            .lineLimit(2)
                            .frame(width: 150, height: 130)
                        Text("Desing by K.I.N.D.E.R. \n SwiftUI")
                            .font(.callout)
                          
                        .fontWeight(.thin)
                        .gradientForeground(colors: [.red, .blue, .purple])
                        
                        .shadow(color: .purple, radius: 3.5, x: 0.1, y: 0.3)
                        .rotationEffect(.degrees(angle))
                        
                        .animation(.interpolatingSpring (mass : 1, stiffness : 1, damping : 99, initialVelocity : 0.2), value: angle)
                        .lineLimit(2)
                        .padding(.bottom, 100)
                        
   
                   
                      
                         
                    
                    }
                          .padding(.bottom,180)

         Spacer()
        
                    }
                   
                    
                    
                }
                
    Spacer()
            
            ZStack {
             
                GifImage2("ff")
                    .opacity(self.din == true ? 1 : -1)
                    .frame(width: 250, height: 250)
                 
                    .blur(radius: 0.5)
                    .scaleEffect(scale)
                    .onAppear{
                        let baseAnimation = Animation.easeOut(duration: 20)
                        let repeated = baseAnimation.repeatForever(autoreverses: true)
                        return withAnimation(repeated){
                            self.scale = 0.12}}
           
                .background(.black)
             
            }
                
            
  
        }
        .background(.black)
        .ignoresSafeArea()
        
        
    }
      
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    public func gradientForeground(colors: [Color])-> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing))
            .mask(self)
    }
}

