//
//  Topic.swift
//  Animation-SwiftUI
//
//  Created by Alex Fila on 23/9/24.
//

import SwiftUI

struct Topic: Identifiable, Hashable {
    var id : UUID = UUID()
    var title : String
    var description: String
    var symbol : String
    var destination : Destination
}

