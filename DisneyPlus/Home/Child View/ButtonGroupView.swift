//
//  ButtonGroupView.swift
//  DisneyPlus
//
//  Created by User on 06/07/21.
//

import SwiftUI


struct ButtonGroupView: View {
    
    @State private var _groupName: String? = nil
    var body: some View {
        NavigationLink(
            destination: MovieGroupView(movieGroup: MoviewGroup(rawValue: _groupName ?? "") ?? .disney),
            tag:_groupName ?? MoviewGroup.disney.rawValue,
            selection: $_groupName
        ){
            EmptyView()
        }
        HStack {
            Button(action: { _groupName = MoviewGroup.disney.rawValue
            }){
                image(name: "logo-disney")
            }
            Button(action: { _groupName = MoviewGroup.marvel.rawValue
            }){
                image(name: "logo-marvel")
            }
            Button(action: { _groupName = MoviewGroup.pixar.rawValue
            }){
                image(name: "logo-pixar")
            }
            Button(action: { _groupName = MoviewGroup.starwars.rawValue
            }){
                image(name: "logo-starWars")
            }
            Button(action: { _groupName = MoviewGroup.natgeo.rawValue
            }){
                image(name: "logo-natgeo")
            }
        }.buttonStyle(SquareButtonStyle(size: UIScreen.main.bounds.width/6))
    }
    
    private func image(name: String) -> some View {
        return Image(name)
            .resizable()
            .aspectRatio(2.0, contentMode: .fit)
            .frame(height: 20)
    }
}

struct ButtonGroup_Previews: PreviewProvider {
    static var previews: some View {
        ButtonGroupView()
    }
}
