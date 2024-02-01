//
//  ArtistInfoListView.swift
//  IOSDev2FinalProject
//
//  Created by Ryan Sellers on 12/8/22.
//

import SwiftUI



struct ArtistInfoListView: View {
    var body: some View {
        VStack(){
            NavigationView {
                List {
                    NavigationLink(destination: AboutArtistView()){
                        Text("About 070 Shake")
                    }
                    
                    NavigationLink(destination: NewReleaseView()){
                        Text("New Release")
                    }
                    NavigationLink(destination: ArtistMusicView()){
                        Text("Popular Music")
                    }
                    
                    NavigationLink(destination: ArtistShowsView()){
                        Text("Upcoming Shows")
                    }
                    
                    
                }.navigationTitle("070 Shake App")
            }
        }
    }
}

struct ArtistInfoListView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistInfoListView()
    }
}
