//
//  SongContentView.swift
//  IOSDev2FinalProject
//
//  Created by Ryan Sellers on 12/9/22.
//

import SwiftUI
import UIKit
import AVFoundation

class SoundManager : ObservableObject {
    var audioPlayer: AVPlayer?

    func playSound(sound: String){
        if let url = URL(string: sound) {
            self.audioPlayer = AVPlayer(url: url)
        }
    }
}


struct SongContentView: View {
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }
    
    @State var song1 = false
    @StateObject private var soundManager = SoundManager()
    
    var song: Song
    var body: some View {
        ScrollView(){
            VStack(alignment: .leading, spacing: 10){
            
                Spacer().frame(width: 0, height: 20)
                Text(song.title).font(.system(size: 30)).fontWeight(.bold)
                
                AsyncImage(url: URL(string: song.picture)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 300, height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Group(){
                    Text("Performed by:").font(.system(size: 15)).fontWeight(.semibold)
                    Text(song.artist).font(.system(size: 12))
                    
                    Text("Album:").font(.system(size: 15)).fontWeight(.semibold)
                    Text(song.album).font(.system(size: 12))
                    
                    Text("Duration:").font(.system(size: 15)).fontWeight(.semibold)
                    let (_,m,s) = secondsToHoursMinutesSeconds(Int(song.duration)!)
                    Text("\(m)m \(s)s").font(.system(size: 12))
                    Text("Preview:").font(.system(size: 15)).fontWeight(.semibold)
                    
                    
                }
                
                if (song.preview == "")
                {
                    Text("Unavailable for current song").font(.system(size: 12))
                }
                else
                {
                    Image(systemName: song1 ? "pause.circle.fill": "play.circle.fill")
                                .font(.system(size: 25))
                                .padding(.trailing)
                                .onTapGesture {
                                    soundManager.playSound(sound: song.preview)
                                    song1.toggle()
                                    
                                    if song1{
                                        soundManager.audioPlayer?.play()
                                    } else {
                                        soundManager.audioPlayer?.pause()
                                    }
                                }
                }
                
                Link("Spotify Page", destination: URL(string: song.trackLink)!).font(.largeTitle).foregroundColor(.green)
  
            }
        }.frame(width: 350)
    }
}

struct SongContentView_Previews: PreviewProvider {
    static let songPreview = Song(platform: "spotify", type: "track", sid: "5Z2MiIZ5I3jJvvmeWMLbOQ", title: "Escapism.", artist: "RAYE, 070 Shake", artistLink: "https://open.spotify.com/artist/2hk94pAZS1iYSqoICeTyh1", album: "Escapism. / The Thrill Is Gone.", albumLink: "https://open.spotify.com/album/3omkMn8vbTKOebb9ABbqyb", isrc: "QMDA62217995", duration: "233", trackLink: "https://open.spotify.com/track/5Z2MiIZ5I3jJvvmeWMLbOQ", preview: "https://p.scdn.co/mp3-preview/2cabcc56b248c620481a8495b2aed6e2734b3cec?cid=ab89d005ca4846da8ab4d60076ebc676", picture: "https://i.scdn.co/image/ab67616d00001e02025dacb513f2b67e6432d56e", position: "1", shareUrls: [])
    static var previews: some View {
        SongContentView(song: songPreview)
    }
}
