//
//  AboutArtistView.swift
//  IOSDev2FinalProject
//
//  Created by Ryan Sellers on 12/8/22.
//

import SwiftUI

struct AboutArtistView: View {
    var body: some View {
        HStack(){
            Spacer().frame(width: 10, height: 10)
            
                VStack(alignment: .leading, spacing: 5){
                    Text("About 070 Shake").fontWeight(.bold).font(.system(size: 30))
                    Divider()
                    ScrollView{
                        VStack(){
                            
                            Image("About070Pic1").resizable()
                                .aspectRatio(contentMode: .fit).border(.gray).cornerRadius(10)
                            Divider()
                            
                            Text("Ranging from fraught to vicious, the voice of rapper and singer 070 Shake is among the most unique in contemporary rap. The New Jersey artist's breakthrough came in 2016 with 'Trust Nobody,' which was licensed by Kanye West's label. She released her first EP, Glitter, in 2018, followed by the full-length Modus Vivendi in 2020 and You Can't Kill Me Because I Don't Exist in 2022.\n\nBorn Danielle Balbuena, she came up as part of the 070 crew, breaking through in 2016 as a teenager with 'Trust Nobody, which was originally released during the year's first quarter. The cold-blooded track was picked up by Kanye West's Def Jam-supported Getting out our dreams label, which re-released it in late September as Shake was about to begin an extensive October-November trek across the U.S. as the opening act for the 1975. A lil Yachty collaboration titled 'rewind' was issued during that stretch.\n\nJust after the tour's completion, Def Jam released the various-artists Direct Deposit, Vol. 1 compilation and featured 'Trust Nobody' as the finale. Shortly thereafter, Shake and her 070 associates -- including Ralphy River, Treee Safari, and Phi -- independently released a compilation of their own, The 070 Project: Chapter One. Another independent Shake single, 'Stranger,' followed in April 2017.\n\nIn 2018, she headed out on her own with the Glitter EP, which featured 'I Laugh When I'm with Friends But Sad When I'm Alone' and 'Somebody Like Me' with clique-mate Phi. Her mainstream breakthrough arrived months later via key inclusions on 'Santeria' from Pusha T's Daytona, as well as 'Ghost Town' and 'Violent Crimes' from Kanye West's Ye. The following year saw the release of the singles 'Nice to Have' and 'Morrow,' both of which ended up on her 2020 debut album, Modus Vivendi. Two years later, she unveiled her sophomore effort, You Can't Kill Me Because I Don't Exist, which included the single 'Lose My Cool' (feat. NLE Choppa). ~ Andy Kellman, Rovi")
                            
                            Divider()
                            
                            Image("About070Pic2").resizable()
                                    .aspectRatio(contentMode: .fit).border(.gray).cornerRadius(10)
                            
                            
                            
                        }
                }
            }
            Spacer().frame(width: 10, height: 10)
        }
    }
}

struct AboutArtistView_Previews: PreviewProvider {
    static var previews: some View {
        AboutArtistView()
    }
}
