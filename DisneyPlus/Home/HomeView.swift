//
//  HomeView.swift
//  DisneyPlus
//
//  Created by User on 06/07/21.
//

import SwiftUI


struct HomeView: View {
    
    @EnvironmentObject var homeVM: HomeViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color.black, Color.darkGray.opacity(0.9)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    ).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center, spacing: 10) {
                        Image("logo")
                            .resizable()
                            .frame(height: 40)
                            .aspectRatio(1.7, contentMode: .fit)
                        MoviewCarouselView(pageViews: homeVM.pageView)
                        ButtonGroupView()
                        HorizontalList(group: .recomendation)
                        HorizontalList(group: .new)
                        Spacer()
                    }
                }
            }.navigationBarHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environment(\.colorScheme, .light)
            .environmentObject(HomeViewModel())
        
        HomeView()
            .environment(\.colorScheme, .dark)
            .environmentObject(HomeViewModel())
    }
}
