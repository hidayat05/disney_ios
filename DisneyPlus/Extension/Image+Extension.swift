//
//  Image+Extension.swift
//  DisneyPlus
//
//  Created by User on 06/07/21.
//

import SwiftUI

extension Image: Identifiable {
    public var id: String {
        return UUID().uuidString
    }
}
