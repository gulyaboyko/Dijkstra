//
//  DijkstraAlgo.swift
//  GraphShortestWay
//
//  Created by Gulya Boiko on 8/18/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//

import Foundation

struct DijkstraAlgo {
    func run(VE: [[(v: Int, e: Int)?]], from: Int, to: Int) throws -> [Edge] {
        guard from >= 0 && from < VE.count && to >= 0 && to < VE.count else { throw NSError() }
        
        var route = Array(repeating: Edge?.none, count: VE.count)
        func convertRouteToResult() -> [Edge] {
            var result: [Edge] = []
            guard let finalEdge = route[to] else { return result }
            result.append(finalEdge)
            var currentV = finalEdge.v1 // откуда пришли в конечный пункт
            while currentV != from { // пока не раскрутим до начальной вершины
                guard let edge = route[currentV] else { return result }
                result.append(edge)
                let prevV = edge.v1
                currentV = prevV // откуда сюда пришли
            }
            return result
        }
        
        // Initialization
        var markers: [Int: Int] = [:]
        for i in 0..<VE.count {
            markers[i] = Int.max
        }
        markers[from] = 0
        
        while !markers.isEmpty {
            guard let marker = (markers.min { a, b in a.value < b.value }), marker.key != to else {
                return convertRouteToResult()
            } // минимальная вершина
            for ve in VE[marker.key] where ve != nil { // все ребра инцидентные выбраной вершине
                // ve.v - новая вершина
                // ve.e - путь от текущей к новой вершине
                if let ve = ve, markers.keys.contains(ve.v) { // если очередная вершина еще не обработана
                    if markers[marker.key] != nil, markers[marker.key]! + ve.e < markers[ve.v]! {
                        markers[ve.v] = markers[marker.key]! + ve.e
                        route[ve.v] = Edge(v1: marker.key, v2: ve.v, weight: ve.e)
                    }
                }
            }
            // удалим использованную вершину
            markers[marker.key] = nil
        }
        return convertRouteToResult()
    }
}
