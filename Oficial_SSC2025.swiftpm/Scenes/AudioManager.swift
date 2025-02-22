//
//  AudioManager.swift
//  Origami
//
//  Created by Leonardo Mesquita Alves on 19/02/25.
//


import AVFoundation

class AudioManager: ObservableObject {
    var player: AVAudioPlayer?
    
    func playSound(sound: AudioName) {
        if let path = Bundle.main.path(forResource: sound.rawValue, ofType: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                player?.play()
                player?.volume = sound == .chapter2and3 ? 0.2 : 0.1
                player?.numberOfLoops = -1
            } catch {
                print("Audio error: \(error)")
            }
        }
    }
    
    func forceStop() {
        player?.stop()
    }
}

enum AudioName: String {
    case chapter2and3 = "BackgroundSong"
    case chapter1 = "MenuSong"
}
