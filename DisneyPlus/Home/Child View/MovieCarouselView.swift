//
//  MovieCarouselView.swift
//  DisneyPlus
//
//  Created by User on 06/07/21.
//

import SwiftUI


struct MoviewCarouselView: View {
    
    var pageViews = [Image]()
    
    @State private var _currentIndex = 0
    var body: some View {
        VStack {
            TabView(selection: $_currentIndex){
                ForEach(0 ..< pageViews.count, id: \.self){ index in
                    pageViews[index]
                        .resizable()
                        .aspectRatio(1.7, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 225)
            
            HStack {
                ForEach(0 ..< pageViews.count) { index in
                    Circle()
                        .fill(index == _currentIndex ? Color.white : Color.white.opacity(0.3))
                        .frame(width: 5, height: 5)
                        .scaleEffect(index == _currentIndex ? 1.5 : 1 )
                }
            }
        }
    }
}

struct MoviewCarousel_Previews: PreviewProvider {
    static var previews: some View {
        MoviewCarouselView(pageViews: [Image("pg-mandalorian"), Image("pg-mulan")])
    }
}
