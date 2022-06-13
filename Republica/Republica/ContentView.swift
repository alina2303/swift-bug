//
//  ContentView.swift
//  VideoWallpaper
//
//  Created by Kenneth Christiansen on 13/04/2022.
//

import SwiftUI
import AVKit
import AVFoundation


struct PlayerView: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }

    func makeUIView(context: Context) -> UIView {
        return LoopingPlayerUIView(frame: .zero)
    }
}


class LoopingPlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        let fileUrl = Bundle.main.url(forResource: "butterfly", withExtension: "mp4")!

        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)

        // Setup the player
        let player = AVQueuePlayer()
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        
        // Create a new player looper with the queue player and template item
        playerLooper = AVPlayerLooper(player: player, templateItem: item)

        // Start the movie
        player.play()
        player.isMuted = true

        NotificationCenter.default.addObserver(self, selector: #selector(appDidActivate), name: UIApplication.didBecomeActiveNotification, object: nil)
    }

    @objc func appDidActivate() {
        playerLayer.player?.play()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}


struct ContentView: View {
    var body: some View {

        GeometryReader{ geo in
            ZStack {
                PlayerView()
//                    .scaledToFill()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: geo.size.width, height: geo.size.height+100)
//                    .overlay(Color.black.opacity(0.2))
//                    .blur(radius: 1)
                .edgesIgnoringSafeArea(.all)

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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
