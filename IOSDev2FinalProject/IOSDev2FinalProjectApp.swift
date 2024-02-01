//
//  IOSDev2FinalProjectApp.swift
//  IOSDev2FinalProject
//
//  Created by Ryan Sellers on 12/8/22.
//

import SwiftUI

struct SongsData: Codable, Identifiable {
    let id = UUID()
    var status: String
    var songs: [Song]
    
    enum CodingKeys: String, CodingKey {
        case status
        case songs
    }
}

func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
    return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
}

struct Song: Codable, Identifiable {
    let id = UUID()
    let platform: String
    let type: String
    let sid: String
    let title: String
    let artist: String
    let artistLink: String
    let album: String
    let albumLink: String
    let isrc: String
    let duration: String
    let trackLink: String
    let preview: String
    let picture: String
    let addedDate: Date
    let position: String
    let shareUrls: [String]
    
    
    
    enum CodingKeys: String, CodingKey {
        case platform
        case type
        case sid
        case title
        case artist
        case artistLink
        case album
        case albumLink
        case isrc
        case duration
        case trackLink
        case preview
        case picture
        case addedDate
        case position
        case shareUrls
    }
    
    init(platform: String, type: String, sid: String, title: String, artist: String, artistLink: String, album: String, albumLink: String, isrc: String, duration: String, trackLink: String, preview: String, picture: String, position: String, shareUrls: [String])
    {
        self.platform = platform
        self.type = type
        self.sid = sid
        self.title = title
        self.artist = artist
        self.artistLink = artistLink
        self.album = album
        self.albumLink = albumLink
        self.isrc = isrc
        self.duration = duration
        self.trackLink = trackLink
        self.preview = preview
        self.picture = picture
        self.addedDate = Date()
        self.position = position
        self.shareUrls = shareUrls
        
        
    }
}

class SongsLoader {
    class func load(jsonFileName: String) -> SongsData? {
        var songsData: SongsData?
        let jsonDecoder = JSONDecoder()
        //jsonDecoder.dateDecodingStrategy = .iso8601
        
        
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
            let jsonData = try? Data(contentsOf: jsonFileUrl){
            songsData = try? jsonDecoder.decode(SongsData.self, from: jsonData)
        }
        
        return songsData
    }
}

@main
struct IOSDev2FinalProjectApp: App {
    let songsData: SongsData?
    init()
    {
        songsData = SongsLoader.load(jsonFileName: "070ShakeSongs")
        
        if let songsData = songsData {
            
            print("Status: \(songsData.status)")
            for song in songsData.songs {
                print("id = \(song.id), platform = \(song.platform), type = \(song.type), title = \(song.title), artist = \(song.artist), album = \(song), added date\(song.addedDate)")
            }
        }
        else{
            print("else")
        }
        
    }
    
    var body: some Scene {
        WindowGroup {
            ArtistInfoListView()
        }
    }
}
