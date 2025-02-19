//
//  AudioManager.swift
//  Origami
//
//  Created by Leonardo Mesquita Alves on 19/02/25.
//


import AVFoundation

class AudioManager: ObservableObject{
    var player: AVAudioPlayer?
    
    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                player?.play()
                player?.volume = 0.1
                player?.numberOfLoops = -1
            } catch {
                print("ERROR")
            }
        }
    }
    
    func forceStop() {
        player?.stop()
    }
}
