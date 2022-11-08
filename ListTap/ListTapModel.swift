//
//  ListTap.swift
//  ListTap
//
//  Created by Igor Łopatka on 26/09/2022.
//

import SwiftUI

struct ListTapElement: Hashable, Identifiable {
    let id = UUID()
    var number: Int
    let color: Color
}
