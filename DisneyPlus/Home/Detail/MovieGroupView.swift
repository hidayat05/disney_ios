//
//  MovieGroupView.swift
//  DisneyPlus
//
//  Created by User on 06/07/21.
//

import SwiftUI


struct ScrollViewPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct MovieGroupView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var _logoOpacity : CGFloat = 0
    @State private var _backgroundOpacity: CGFloat = 0
    
    
    var movieGroup: MoviewGroup
    
    var body: some View {
        ZStack {
            VStack {
                Image("bg-\(movieGroup.rawValue)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(Double(_backgroundOpacity))
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]),
                                         startPoint: .top,
                                         endPoint: .bottom)
                    )
                    .frame(height: 50)
                    .offset(y: -55)
                    .opacity(1 - Double(_logoOpacity))
                Spacer()
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Text("")
                .toolbar{
                    ToolbarItem(placement: .principal){
                        Image("logo-\(movieGroup.rawValue)")
                            .resizable()
                            .aspectRatio(2.8,contentMode: .fit)
                            .frame(height:25)
                    }
                }
            ScrollView(showsIndicators: false){
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10){
                    Image("logo-\(movieGroup.rawValue)")
                        .resizable()
                        .aspectRatio(2.8,contentMode: .fit)
                        .frame(height: 75)
                        .padding(.top, 128)
                        .padding(.bottom, 20)
                        .opacity(Double(_logoOpacity))
                    
                    HorizontalList(group: .recomendation)
                    HorizontalList(group: .recomendation)
                    HorizontalList(group: .recomendation)
                    
                    Spacer()
                }
                GeometryReader { geometry in
                    let offset = geometry.frame(in: .named("scrollView")).maxY
                    Color.clear.preference(key: ScrollViewPreferenceKey.self, value: offset)
                }
            }
            .coordinateSpace(name: "scrollView")
            .onPreferenceChange(ScrollViewPreferenceKey.self){ value in
                if ScrollViewPreferenceKey.defaultValue == 0 {
                    ScrollViewPreferenceKey.defaultValue = value
                }
                let logoHeightToFade: CGFloat = 50
                self._logoOpacity = (logoHeightToFade - max((ScrollViewPreferenceKey.defaultValue - value), 0)) / logoHeightToFade
                
                let bgHeightToFade : CGFloat = 275
                self._backgroundOpacity = bgHeightToFade - max((ScrollViewPreferenceKey.defaultValue - value), 0) / bgHeightToFade
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(
                                action: {
                                    mode.wrappedValue.dismiss()
                                }, label: {
                                    Image(systemName: "arrowtriangle.backward.circle.fill")
                                        .resizable()
                                        .foregroundColor(.white)
                                }).frame(width: 24, height: 24)
        )
        .background(Color.black)
    }
}


struct MovieGroupView_Previews: PreviewProvider {
    static var previews: some View {
        MovieGroupView(movieGroup: .marvel)
    }
}
