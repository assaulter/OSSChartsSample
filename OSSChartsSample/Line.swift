//
//  Line.swift
//  OSSChartsSample
//
//  Created by Kazuki Kubo on 2022/10/11.
//

import SwiftUI
import Charts

struct Line: UIViewRepresentable {
    
    typealias UIViewType = LineChartView
    
    var fats: [ChartData.Fat]
    private var entries: [ChartDataEntry] {
        return fats.map { .init(x: Double($0.index), y: Double($0.fat)) }
    }
    
    func makeUIView(context: Context) -> LineChartView {
        let chart = LineChartView()
        chart.data = data()
        // configure chart
        chart.leftAxis.enabled = false
        chart.legend.enabled = false
        // xAxis
        let xAxis = chart.xAxis
        xAxis.labelTextColor = .systemGray
        xAxis.labelPosition = .bottom
        xAxis.drawGridLinesEnabled = false
        xAxis.valueFormatter = IndexAxisValueFormatter(values: fats.map { $0.date })
        // yAxis
        let rightAxys = chart.rightAxis
        rightAxys.setLabelCount(5, force: true)
        rightAxys.labelTextColor = .systemGray
        
        return chart
    }
    
    func updateUIView(_ uiView: LineChartView, context: Context) {
        uiView.data = data()
    }
    
    private func data() -> LineChartData {
        let dataSet = LineChartDataSet(entries: entries)
        dataSet.colors = [.systemBlue]
        dataSet.drawValuesEnabled = false
        dataSet.circleRadius = 5.0
        dataSet.circleColors = [.systemBlue]
        let data = LineChartData(dataSet: dataSet)
        
        return data
    }
}

struct Line_Previews: PreviewProvider {
    static var previews: some View {
        Line(fats: ChartData.fats)
    }
}
