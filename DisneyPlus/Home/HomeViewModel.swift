//
//  HomeViewModel.swift
//  DisneyPlus
//
//  Created by User on 06/07/21.
//

import Foundation
import SwiftUI


enum ListGroup {
    case recomendation
    case new
    
    var list: [Image] {
        switch self {
        case .recomendation: return HomeViewModel().recomendation
        case .new: return HomeViewModel().newPosters
        }
    }
    
    var title: String {
        switch self {
        case .recomendation: return "Recomended for you"
        case .new : return "New to Disnety+"
        }
    }
}

enum MoviewGroup: String {
    case disney
    case pixar
    case marvel
    case starwars
    case natgeo
}

class HomeViewModel:ObservableObject, Identifiable {
    
    @Published var pageView = [Image]()
    @Published var newPosters = [Image]()
    @Published var recomendation = [Image]()
    
    init() {
        setupPages()
        setupRecomendation()
        setupNewMovies()
    }
    
    private func setupPages(){
        pageView = [
            Image("pg-mandalorian"),
            Image("pg-sorcererApprentice"),
            Image("pg-mulan"),
            Image("pg-animalKingdom")
        ]
    }
    
    private func setupRecomendation() {
        recomendation = [
            Image("poster-avengers"),
            Image("poster-sorcerer"),
            Image("poster-moana"),
            Image("poster-solo"),
            Image("poster-hocusPocus"),
            
        ]
    }
    
    private func setupNewMovies() {
        newPosters = [
            Image("poster-mandalorian"),
            Image("poster-snowman"),
            Image("poster-sorcerer"),
            Image("poster-animalKingdom"),
            Image("poster-toyStory"),
            
        ]
    }
}
