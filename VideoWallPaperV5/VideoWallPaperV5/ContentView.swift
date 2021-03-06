//
//  ContentView.swift
//  VideoWallPaperV5
//
//  Created by Kenneth Christiansen on 13/04/2022.
//


import SwiftUI
import AVKit


struct ContentView: View {
    
//    let player = AVPlayer(url:  URL(string: "https://bit.ly/swswift")!)
//    let player = AVPlayer(url: Bundle.main.url(forResource: "republica_showreel2", withExtension: "mp4")!)
    let player = AVPlayer(url: Bundle.main.url(forResource: "butterfly", withExtension: "mp4")!)

    
    var body: some View {
        ZStack {
                VideoPlayer(player: player)
                .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .onAppear {
                        player.play()
//                        player.isMuted = true
                    }

            
            VStack{
                Text("Airplay til dette lokale:\n**\(UIDevice.current.name)**")
                    .multilineTextAlignment(.leading)
                    .padding()
                    .background(Color.black.cornerRadius(10).opacity(0.6))
                    .position(x: 200, y: 100)
                    .font(Font.custom("Hill", size: 33))
                    .lineSpacing(15)
                    .foregroundColor(Color.white)
    Spacer()
}

            }
    }
}
