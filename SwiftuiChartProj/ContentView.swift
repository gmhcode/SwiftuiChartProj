//
//  ContentView.swift
//  SwiftuiChartProj
//
//  Created by Greg Hughes on 3/4/21.
//

import SwiftUI

let highIntensity = Legend(color: .orange, label: "High Intensity", order: 5)
let buildFitness = Legend(color: .yellow, label: "Build Fitness", order: 4)
let fatBurning = Legend(color: .green, label: "Fat Burning", order: 3)
let warmUp = Legend(color: .blue, label: "Warm Up", order: 2)
let low = Legend(color: .gray, label: "Low", order: 1)

let limit = DataPoint(value: 130, label: "5", legend: fatBurning)



struct ContentView: View {
    @State var points: [DataPoint] = [
        .init(value: 70, label: "1", legend: low),
        .init(value: 90, label: "2", legend: warmUp),
        .init(value: 91, label: "3", legend: warmUp),
        .init(value: 92, label: "4", legend: warmUp),
        .init(value: 130, label: "5", legend: fatBurning),
        .init(value: 124, label: "6", legend: fatBurning),
        .init(value: 135, label: "7", legend: fatBurning),
        .init(value: 133, label: "8", legend: fatBurning),
        .init(value: 136, label: "9", legend: fatBurning),
        .init(value: 138, label: "10", legend: fatBurning),
        .init(value: 150, label: "11", legend: buildFitness),
        .init(value: 151, label: "12", legend: buildFitness),
        .init(value: 150, label: "13", legend: buildFitness),
        .init(value: 136, label: "14", legend: fatBurning),
        .init(value: 135, label: "15", legend: fatBurning),
        .init(value: 130, label: "16", legend: fatBurning),
        .init(value: 130, label: "17", legend: fatBurning),
        .init(value: 150, label: "18", legend: buildFitness),
        .init(value: 151, label: "19", legend: buildFitness),
        .init(value: 150, label: "20", legend: buildFitness),
        .init(value: 160, label: "21", legend: highIntensity),
        .init(value: 159, label: "22", legend: highIntensity),
        .init(value: 161, label: "23", legend: highIntensity),
        .init(value: 158, label: "24", legend: highIntensity),
//        .init(value: 2000, label: "24", legend: highIntensity),
    ]
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
                .onTapGesture {
                    points.append(DataPoint(value: 0, label: "", legend: buildFitness))
                }
            Spacer()
            ScrollView(.horizontal) {
                
                LineChartView(dataPoints: points)
                    .frame(width:CGFloat(points.count) * 30)
                    
                    .onTapGesture {
                        
                    }
                
            }.frame(height: 300)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//
///// Type that defines a line chart style.
//   struct LineChartStyle: ChartStyle {
//       let lineMinHeight: CGFloat
//       let showAxis: Bool
//       let axisLeadingPadding: CGFloat
//       let showLabels: Bool
//       let labelCount: Int?
//       let showLegends: Bool
//
//    /**
//     Creates new line chart style with the following parameters.
//
//     - Parameters:
//        - lineMinHeight: The minimal height for the point that presents the biggest value. Default is 100.
//        - showAxis: Bool value that controls whenever to show axis.
//        - axisLeadingPadding: Leading padding for axis line. Default is 0.
//        - showLabels: Bool value that controls whenever to show labels.
//        - labelCount: The count of labels that should be shown below the the chart.
//        - showLegends: Bool value that controls whenever to show legends.
//     */
//
//       init(
//        lineMinHeight: CGFloat = 100,
//        showAxis: Bool = true,
//        axisLeadingPadding: CGFloat = 0,
//        showLabels: Bool = true,
//        labelCount: Int? = nil,
//        showLegends: Bool = true
//    ) {
//        self.lineMinHeight = lineMinHeight
//        self.showAxis = showAxis
//        self.axisLeadingPadding = axisLeadingPadding
//        self.showLabels = showLabels
//        self.labelCount = labelCount
//        self.showLegends = showLegends
//    }
//}
//
///// SwiftUI view that draws data points by drawing a line.
//   struct LineChartView: View {
//    @Environment(\.chartStyle) var chartStyle
//    let dataPoints: [DataPoint]
//
//    /**
//     Creates new line chart view with the following parameters.
//
//     - Parameters:
//     - dataPoints: The array of data points that will be used to draw the bar chart.
//     */
//       init(dataPoints: [DataPoint]) {
//        self.dataPoints = dataPoints
//    }
//
//      var style: LineChartStyle {
//        (chartStyle as? LineChartStyle) ?? .init()
//    }
//
//      var gradient: LinearGradient {
//        let colors = dataPoints.map(\.legend).map(\.color)
//        return LinearGradient(
//            gradient: Gradient(colors: colors),
//            startPoint: .leading,
//            endPoint: .trailing
//        )
//    }
//
//      var grid: some View {
//        ChartGrid(dataPoints: dataPoints)
//            .stroke(
//                style.showAxis ? Color.secondary : .clear,
//                style: StrokeStyle(
//                    lineWidth: 1,
//                    lineCap: .round,
//                    lineJoin: .round,
//                    miterLimit: 0,
//                    dash: [1, 8],
//                    dashPhase: 1
//                )
//            )
//    }
//
//       var body: some View {
//        VStack {
//            HStack(spacing: 0) {
//                LineChartShape(dataPoints: dataPoints)
//                    .fill(gradient)
//                    .frame(minHeight: style.lineMinHeight)
//                    .background(grid)
//
//                if style.showAxis {
//                    AxisView(dataPoints: dataPoints)
//                        .accessibilityHidden(true)
//                        .padding(.leading, style.axisLeadingPadding)
//                }
//            }
//
//            if style.showLabels {
//                LabelsView(dataPoints: dataPoints, labelCount: style.labelCount ?? dataPoints.count)
//                    .accessibilityHidden(true)
//            }
//
//            if style.showLegends {
//                LegendView(dataPoints: dataPoints)
//                    .padding()
//                    .accessibilityHidden(true)
//            }
//        }
//    }
//}
////   struct LineChartStyle: ChartStyle {
////       let lineMinHeight: CGFloat
////       let showAxis: Bool
////       let axisLeadingPadding: CGFloat
////       let showLabels: Bool
////       let labelCount: Int?
////       let showLegends: Bool
////
////    /**
////     Creates new line chart style with the following parameters.
////
////     - Parameters:
////        - lineMinHeight: The minimal height for the point that presents the biggest value. Default is 100.
////        - showAxis: Bool value that controls whenever to show axis.
////        - axisLeadingPadding: Leading padding for axis line. Default is 0.
////        - showLabels: Bool value that controls whenever to show labels.
////        - labelCount: The count of labels that should be shown below the the chart.
////        - showLegends: Bool value that controls whenever to show legends.
////     */
////
////       init(
////        lineMinHeight: CGFloat = 100,
////        showAxis: Bool = true,
////        axisLeadingPadding: CGFloat = 0,
////        showLabels: Bool = true,
////        labelCount: Int? = nil,
////        showLegends: Bool = true
////    ) {
////        self.lineMinHeight = lineMinHeight
////        self.showAxis = showAxis
////        self.axisLeadingPadding = axisLeadingPadding
////        self.showLabels = showLabels
////        self.labelCount = labelCount
////        self.showLegends = showLegends
////    }
////}
//struct LegendView: View {
//    let legends: [Legend]
//
//    init(dataPoints: [DataPoint]) {
//        legends = Array(Set(dataPoints.map { $0.legend })).sorted()
//    }
//
//    var body: some View {
//        LazyVGrid(columns: [.init(.adaptive(minimum: 100))], alignment: .leading) {
//            ForEach(legends, id: \.color) { legend in
//                HStack(alignment: .center) {
//                    Circle()
//                        .fill(legend.color)
//                        .frame(width: 16, height: 16)
//
//                    Text(legend.label)
//                }
//            }
//        }
//    }
//}
//struct LabelsView: View {
//    let dataPoints: [DataPoint]
//    let labelCount: Int
//
//      var threshold: Int {
//        let threshold = Double(dataPoints.count) / Double(labelCount)
//        return Int(threshold.rounded(.awayFromZero))
//    }
//
//    var body: some View {
//        HStack(spacing: 0) {
//            ForEach(dataPoints.indexed(), id: \.1.self) { index, bar in
//                if index % self.threshold == 0 {
//                    Text(bar.label)
//                        .multilineTextAlignment(.center)
//                        .foregroundColor(.accentColor)
//                        .font(.caption)
//                    Spacer()
//                }
//            }
//        }
//    }
//}
//struct AxisView: View {
//    let dataPoints: [DataPoint]
//
//    var body: some View {
//        VStack {
//            dataPoints.max().map {
//                Text(String(Int($0.value)))
//                    .foregroundColor(.accentColor)
//                    .font(.caption)
//            }
//            Spacer()
//            dataPoints.max().map {
//                Text(String(Int($0.value / 2)))
//                    .foregroundColor(.accentColor)
//                    .font(.caption)
//            }
//            Spacer()
//        }
//    }
//}
//extension RandomAccessCollection {
//    func indexed() -> Array<(offset: Int, element: Element)> {
//        Array(enumerated())
//    }
//}
//struct ChartGrid: Shape {
//    let dataPoints: [DataPoint]
//
//    func path(in rect: CGRect) -> Path {
//        Path { path in
//            path.move(to: CGPoint(x: 0, y: 0))
//            path.addLine(to: CGPoint(x: rect.width, y: 0))
//
//            path.move(to: CGPoint(x: 0, y: rect.height))
//            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
//
//            path.move(to: CGPoint(x: 0, y: rect.height / 2))
//            path.addLine(to: CGPoint(x: rect.width, y: rect.height / 2))
//        }
//    }
//}
//  
//struct LineChartShape: Shape {
//    let dataPoints: [DataPoint]
//    var closePath: Bool = true
//
//    func path(in rect: CGRect) -> Path {
//        Path { path in
//            let start = CGFloat(dataPoints.first?.value ?? 0) / CGFloat(dataPoints.max()?.value ?? 1)
//            path.move(to: CGPoint(x: 0, y: rect.height - rect.height * start))
//            let stepX = rect.width / CGFloat(dataPoints.count)
//            var currentX: CGFloat = 0
//            dataPoints.forEach {
//                currentX += stepX
//                let y = CGFloat($0.value / (dataPoints.max()?.value ?? 1)) * rect.height
//                path.addLine(to: CGPoint(x: currentX, y: rect.height - y))
//            }
//
//            if closePath {
//                path.addLine(to: CGPoint(x: currentX, y: rect.height))
//                path.addLine(to: CGPoint(x: 0, y: rect.height))
//                path.closeSubpath()
//            }
//        }
//    }
//}
//
//
////#if DEBUG
////extension DataPoint {
////    static var mock: [DataPoint] {
////        let highIntensity = Legend(color: .orange, label: "High Intensity", order: 5)
////        let buildFitness = Legend(color: .yellow, label: "Build Fitness", order: 4)
////        let fatBurning = Legend(color: .green, label: "Fat Burning", order: 3)
////        let warmUp = Legend(color: .blue, label: "Warm Up", order: 2)
////        let low = Legend(color: .gray, label: "Low", order: 1)
////
////        return [
////            .init(value: 70, label: "1", legend: low),
////            .init(value: 90, label: "2", legend: warmUp),
////            .init(value: 91, label: "3", legend: warmUp),
////            .init(value: 92, label: "4", legend: warmUp),
////            .init(value: 130, label: "5", legend: fatBurning),
////            .init(value: 124, label: "6", legend: fatBurning),
////            .init(value: 135, label: "7", legend: fatBurning),
////            .init(value: 133, label: "8", legend: fatBurning),
////            .init(value: 136, label: "9", legend: fatBurning),
////            .init(value: 138, label: "10", legend: fatBurning),
////            .init(value: 150, label: "11", legend: buildFitness),
////            .init(value: 151, label: "12", legend: buildFitness),
////            .init(value: 150, label: "13", legend: buildFitness),
////            .init(value: 136, label: "14", legend: fatBurning),
////            .init(value: 135, label: "15", legend: fatBurning),
////            .init(value: 130, label: "16", legend: fatBurning),
////            .init(value: 130, label: "17", legend: fatBurning),
////            .init(value: 150, label: "18", legend: buildFitness),
////            .init(value: 151, label: "19", legend: buildFitness),
////            .init(value: 150, label: "20", legend: buildFitness),
////            .init(value: 160, label: "21", legend: highIntensity),
////            .init(value: 159, label: "22", legend: highIntensity),
////            .init(value: 161, label: "23", legend: highIntensity),
////            .init(value: 158, label: "24", legend: highIntensity),
////        ]
////    }
////}
//  
