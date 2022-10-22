//
//  Bar.swift
//  OSSChartsSample
//
//  Created by Kazuki Kubo on 2022/10/11.
//

import Charts
import SwiftUI

struct Bar: UIViewRepresentable {
    
    typealias UIViewType = BarChartView
    
    var weights: [ChartData.Weight]
    private var entries: [BarChartDataEntry] {
        return weights.map { .init(x: Double($0.index), y: Double($0.weight)) }
    }
    private var average: Double {
        return weights
            .map { Double($0.weight) }
            .reduce(.zero, +) / Double(weights.count)
    }
    
    func makeUIView(context: Context) -> BarChartView {
        let chart = BarChartView()
        chart.data = data()
        // configure chart
        chart.leftAxis.enabled = false
        chart.legend.enabled = false
        // xAxis
        let xAxis = chart.xAxis
        xAxis.labelTextColor = .systemGray
        xAxis.labelPosition = .bottom
        xAxis.drawGridLinesEnabled = false
        xAxis.valueFormatter = IndexAxisValueFormatter(values: weights.map { $0.date })
        // yAxis
        let rightAxys = chart.rightAxis
        rightAxys.setLabelCount(5, force: true)
        rightAxys.labelTextColor = .systemGray
        // limit line
        let limit = ChartLimitLine()
        limit.limit = average
        limit.lineColor = .orange
        rightAxys.addLimitLine(limit)
        
        return chart
    }
    
    func updateUIView(_ uiView: BarChartView, context: Context) {
        uiView.data = data()
    }
    
    private func data() -> BarChartData {
        let dataSet = BarChartDataSet(entries: entries)
        dataSet.colors = [.systemBlue]
        dataSet.drawValuesEnabled = false
        let data = BarChartData(dataSet: dataSet)
        data.barWidth = Double(0.3)
        
        return data
    }
}

struct Bar_Previews: PreviewProvider {
    static var previews: some View {
        Bar(weights: ChartData.weights)
    }
}
