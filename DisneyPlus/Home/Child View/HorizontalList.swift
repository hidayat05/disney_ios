//
//  HorizontalList.swift
//  DisneyPlus
//
//  Created by User on 06/07/21.
//

import SwiftUI


struct HorizontalList: View {
    
    @EnvironmentObject var homeVM: HomeViewModel
    private let _group: ListGroup
    private var moviePosters = [Image]()
    
    init(group: ListGroup) {
        self._group = group
        self.moviePosters = _group.list
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0 ){
            Text(_group.title).foregroundColor(.white)
            ScrollView(.horizontal, showsIndicators : false) {
                HStack(alignment: .center, spacing: 10) {
                    ForEach(moviePosters, id: \.id){ image in
                        image
                            .resizable()
                            .frame(width: 100, height: 140, alignment: .center)
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    }
                }.padding()
            }.frame(width: UIScreen.main.bounds.width, height: 160)
            .padding(.horizontal, -20)
        }
    }
}

struct HorizontalList_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalList(group: .recomendation)
            .environmentObject(HomeViewModel())
    }
}
