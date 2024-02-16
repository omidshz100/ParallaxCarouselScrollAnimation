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
                        HStack(spacing: 5) {
                            
                            ForEach(cards) { card in
                                /// in order to move card in reverse direction ( parallax Effects)
                                GeometryReader(content: { proxy in
                                    let cardSize = proxy.size
                                    //=======================================================
                                    // Parallex effect 2 👇
                                    //let minX = proxy.frame(in: .scrollView).minX - 30
                                    // Parallex effect 1👇
                                    let minX = min(((proxy.frame(in: .scrollView).minX - 30) * 1.40), size.width * 1.40)
                                    // ======================================
                                    Image(card.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        //.scaleEffect(1.25)
                                        .offset(x: -minX)
                                    // using this frame with this width oscaling before offset
                                        .frame(width: proxy.size.width * 2.5)
                                        .frame(width: cardSize.width, height: cardSize.height)
                                        .overlay{
                                            VStack{
                                                Text("\(minX)")
                                                    .font(.largeTitle)
                                                    .foregroundStyle(Color.green)
                                                overlayView(card)
                                            }
                                        }
                                        .clipShape(.rect(cornerRadius: 15))
                                        .shadow(color: .black.opacity(0.25), radius: 8, x: 5 , y: 10 )
                                })//GeometryReader
                                .frame(width: size.width - 60 , height: size.height - 50)
                                // Scroll Animation
                                .scrollTransition(.interactive, axis: .horizontal){
                                    view, phase in
                                    
                                    view.scaleEffect(phase.isIdentity ? 1:0.95)
                                }
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
    
    @ViewBuilder
    func overlayView(_ card:TripCard) -> some View {
        ZStack(alignment: .bottomLeading){
            LinearGradient(colors: [
                .clear,
                .clear,
                .clear,
                .clear,
                .clear,
                .black.opacity(0.1),
                .black.opacity(0.5),
                .black
            ], startPoint: .top, endPoint: .bottom)
            
            
            VStack(alignment:.leading, spacing:4){
                Text(card.title)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.white)
                
                Text(card.subtitle)
                    .font(.callout)
                    .foregroundStyle(.white.opacity(0.8))
            }
            .padding(20)
        }
        
        
    }
}

#Preview {
    ContentView()
}
