//
//  ArtistMusicView.swift
//  IOSDev2FinalProject
//
//  Created by Ryan Sellers on 12/8/22.
//

import SwiftUI

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }

        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}

let songsData: SongsData = SongsLoader.load(jsonFileName: "070ShakeSongs")!

struct ArtistMusicView: View {
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        NavigationView
        {
            VStack{
                
                ScrollView
                {
                    ForEach(songsData.songs)
                    {
                        song in
                        NavigationLink(destination: SongContentView(song: song))
                        {
                            GeometryReader
                            {
                                geometry in
                                VStack(){
                                    HStack(){
                                        
                                        
                                        AsyncImage(url: URL(string: song.picture)) { image in
                                            image.resizable()
                                        } placeholder: {
                                            Color.gray
                                        }
                                        .frame(width: 50, height: 50)
                                        .clipShape(RoundedRectangle(cornerRadius: 5))

                                        
                                        VStack (alignment: .leading, spacing: 10){
                                            Text(song.title).font(.system(size: 15)).foregroundColor(.black)
                                            Text(song.artist).font(.system(size: 10)).foregroundColor(.black)
                                            
                                        }
                                        Spacer()
                                        
                                    }.frame(width: 250, height: 50)
                                }
                            }.frame(width: 280, height: 50)
                        }
                    }
                }.navigationTitle(Text("Popular Songs"))
            }
        }
    }
}

struct ArtistMusicView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistMusicView()
    }
}
