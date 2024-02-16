//
//  Home.swift
//  ParallaxCarouselScrollAnimation
//
//  Created by Omid Shojaeian Zanjani on 16/02/24.
//
//⚠️  🚧🚧🚧 under veveloping 🚧🚧🚧🚧
import SwiftUI

struct Home: View {
    // View poroperties
    @State var searchText:String = ""
    var body: some View {
        ScrollView(.vertical){
            VStack(spacing: 15) {
                HStack(spacing: 12) {
                    Button(action: {}) {
                        Image(systemName: "line.3.horizontal")
                    }
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search", text: $searchText)
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .background(.ultraThinMaterial, in: .capsule)
                }
                
                Text("Where do you like to \ntravel? ")
                    .font(.largeTitle.bold())
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.top, 10)
                
                // Parallax View
                GeometryReader {
                    let size = $0.size
                    ScrollView(.horizontal){
                        HStack(spacing: 10) {
                            
                            ForEach(cards) { card in
                                /// in order to move card in reverse direction ( parallax Effects)
                                GeometryReader(content: { proxy in
                                    let cardSize = proxy.size
                                    Image(card.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: cardSize.width, height: cardSize.height)
                                        .clipShape(.rect(cornerRadius: 15))
                                        .shadow(color: .black.opacity(0.25), radius: 8, x: 5 , y: 10 )
                                })
                                .frame(width: size.width - 60 , height: size.height - 50)
                            }
                        }// HStack
                        .padding(.horizontal, 30)
                        .scrollTargetLayout()
                        .frame(height: size.height, alignment: .top  )
                    }// ScrollView
                    .scrollIndicators(.hidden)
                    .scrollTargetBehavior(.viewAligned)
                }// GeometryReader
                .frame(height: 500)
                .padding(.horizontal,-15)
                .padding(.top, 10)
            }
            .padding(15)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ContentView()
}
