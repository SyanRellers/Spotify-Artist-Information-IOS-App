//
//  ArtistShowsView.swift
//  IOSDev2FinalProject
//
//  Created by Ryan Sellers on 12/8/22.
//

import SwiftUI

struct ArtistShowsView: View {
    var body: some View {
        HStack(){
            Spacer().frame(width: 20)
            VStack(alignment: .leading){
                Text("070 Shake Shows").fontWeight(.bold).font(.system(size: 30))
                Divider()
                ScrollView{
                    
                    VStack(alignment: .leading, spacing: 20){
                        HStack(spacing: 15){
                            Text("Jun 24").frame(width: 30)
                            Text("8:00 PM")
                            
                            Link("Roskilde Festival", destination: URL(string: "https://www.songkick.com/festivals/920-roskilde/id/40701100-roskilde-festival-2023?utm_source=8123&utm_medium=partner&utm_content=&utm_campaign=entity")!)
                        }
                        Divider()
                        
                        HStack(spacing: 15){
                            Text("Jun 30").frame(width: 30)
                            Text("8:00 PM")
                            
                            Link("Down the Rabbit Hole 2023", destination: URL(string: "https://www.ticketmaster.nl/event/down-the-rabbit-hole-2023-tickets/287291?clickId=zmR0Dqy0TxyNWADW-MxoQWoVUkAxp%3A1WpUW9VA0&irgwc=1&utm_source=296934-Spotify&utm_medium=affiliate&utm_campaign=296934&camefrom=CFC_BUYAT_296934&ircid=7510")!)
                        }
                        Divider()
                        
                        HStack(spacing: 15){
                            Text("Jul 12").frame(width: 30)
                            Text("8:00 PM")
                            
                            Link("Dour Festival 2023", destination: URL(string: "https://www.songkick.com/festivals/1228-dour/id/40762769-dour-festival-2023?utm_source=8123&utm_medium=partner&utm_content=063b3d25f17b0500cc287b12beb9c32e&utm_campaign=entity")!)
                        }
                        Divider()
                        Image("Performance").resizable()
                            .aspectRatio(contentMode: .fit).border(.gray).cornerRadius(10)
                    }
                }
            }
            Spacer().frame(width: 20)
        }
    }
}

struct ArtistShowsView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistShowsView()
    }
}
