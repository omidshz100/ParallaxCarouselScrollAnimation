//
//  TripCard.swift
//  ParallaxCarouselScrollAnimation
//
//  Created by Omid Shojaeian Zanjani on 16/02/24.
//

import Foundation


struct TripCard: Identifiable, Hashable {
    var id:UUID = .init()
    var title:String
    var subtitle:String
    var image:String
}


// Sample Cards

let cards:[TripCard] = [
    .init(title: "Lodon", subtitle: "England", image: "theuk"),
    .init(title: "New Zaland", subtitle: "New Zland", image: "newzland"),
    .init(title: "New York", subtitle: "The US", image: "newyork"),
    .init(title: "Ireland", subtitle: "Irelan", image: "ireland"),
    .init(title: "Denmark", subtitle: "Denmark", image: "denmark"),
]
