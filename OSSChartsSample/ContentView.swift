//
//  ContentView.swift
//  OSSChartsSample
//
//  Created by Kazuki Kubo on 2022/10/11.
//

import Charts
import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Section {
                VStack(alignment: .leading) {
                    Text("Weight Chart")
                        .font(.largeTitle)
                        .foregroundStyle(.primary)
                    Bar(weights: ChartData.weights)
                        .frame(width: .infinity, height: 200.0)
                }
            }
            Section {
                VStack(alignment: .leading) {
                    Text("Fat Chart")
                        .font(.largeTitle)
                        .foregroundStyle(.primary)
                    Line(fats: ChartData.fats)
                        .frame(width: .infinity, height: 200.0)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
