//
//  Edge.swift
//  GraphShortestWay
//
//  Created by Gulya Boiko on 8/18/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//

import Foundation

struct Edge: Hashable {
    let v1: Int // пара вершин,
    let v2: Int // которые связывают ребро
    let weight: Int
}
