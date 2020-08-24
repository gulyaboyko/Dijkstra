//
//  GraphShortestWayTests.swift
//  GraphShortestWayTests
//
//  Created by Gulya Boiko on 8/18/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//

import XCTest
//@testable import GraphShortestWay

final class GraphShortestWayTests: XCTestCase {
    let VE: [[(Int, Int)?]] = [ // Номер вершины + вес ребра
        [(1, 2), (2, 3), (3, 6), nil, nil], // A
        [(0, 2), (2, 4), (4, 9), nil, nil], // B
        [(0, 3), (1, 4), (3, 1), (4, 7), (5, 6)], // C
        [(0, 6), (2, 1), (5, 4), nil, nil], // D
        [(1, 9), (2, 7), (5, 1), (6, 5), nil], // E
        [(4, 1), (2, 6), (3, 4), (6, 8), nil], // F
        [(4, 5), (5, 8), nil, nil, nil]  // G
    ]
    
    func test_DijkstraAlgo() {
        let sut = DijkstraAlgo()
        let edges = try? sut.run(VE: VE, from: 0, to: 6)
        print(edges)
    }

}
