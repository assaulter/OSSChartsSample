//
//  ChartData.swift
//  OSSChartsSample
//
//  Created by Kazuki Kubo on 2022/10/11.
//

import Foundation
import Charts

struct ChartData {
    
    // MARK: - Weight
    
    struct Weight {
        let weight = Float.random(in: 51...57)
        var date: String
        var index: Int
    }
    
    static let dates: [String] = [
        "8/13", "8/14", "8/15", "8/16", "8/17", "8/18", "8/19"
    ]
    
    static var weights: [Weight] {
        return dates.enumerated().map { .init(date: $0.element, index: $0.offset) }
    }
    
    // MARK: - fat
    
    struct Fat {
        let fat = Float.random(in: 15...25)
        var date: String
        var index: Int
    }
    
    static var fats: [Fat] {
        return dates.enumerated().map { .init(date: $0.element, index: $0.offset) }
    }
}
