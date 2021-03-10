//
//  extensions.swift
//  SwiftuiChartProj
//
//  Created by Greg Hughes on 3/5/21.
//
//
//import Foundation
//import SwiftUI
//
//struct DataPoint {
//    let value: Double
//    let label: LocalizedStringKey
//    let legend: Legend
//    let visible: Bool
//
// /**
//  Creates new data point with the following parameters.
//
//  - Parameters:
//     - value: Double that represents a value of the point in the chart.
//     - label: LocalizedStringKey that describes the point.
//     - legend: The legend of data point, usually appears below the chart.
//     - visible: The boolean that controls the visibility of the data point in the chart. Default value is true.
//  */
//    init(value: Double, label: LocalizedStringKey, legend: Legend, visible: Bool = true) {
//     self.value = value
//     self.label = label
//     self.legend = legend
//     self.visible = visible
// }
//}
//
//extension DataPoint: Hashable {
//    static func == (lhs: DataPoint, rhs: DataPoint) -> Bool {
//
// 
//    func hash(into hasher: inout Hasher) {
//     
//     hasher.combine(legend)
//     hasher.combine(value)
// }
//}
//
//extension DataPoint: Comparable {
//    static func < (lhs: DataPoint, rhs: DataPoint) -> Bool {
//     lhs.value < rhs.value
// }
//}
//
//protocol ChartStyle {
// var showLabels: Bool { get }
// var showAxis: Bool { get }
// var showLegends: Bool { get }
//}
//
//struct ChartStyleEnvironmentKey: EnvironmentKey {
// static var defaultValue: ChartStyle?
//}
//
////public extension EnvironmentValues {
//// var chartStyle: ChartStyle? {
//////     get { self[ChartStyleEnvironmentKey.self] }
//////     set { self[ChartStyleEnvironmentKey.self] = newValue }
//// }
////}
//
//extension View {
//    func chartStyle(_ style: ChartStyle) -> some View {
//     environment(\.chartStyle, style)
// }
//}
//
//struct Legend {
// let color: Color
// let label: LocalizedStringKey
// let order: Int
//
// /**
//  Creates new legend with the following parameters.
//
//  - Parameters:
//     - color: The color of the group that will be used to draw data points.
//     - label: LocalizedStringKey that describes the legend.
//     - order: The number that will be used to sort chart legends list. Default value is 0.
//  */
//    init(color: Color, label: LocalizedStringKey, order: Int = 0) {
//     self.color = color
//     self.label = label
//     self.order = order
// }
//}
//extension Legend: Comparable {
//    static func < (lhs: Self, rhs: Self) -> Bool {
//     lhs.order < rhs.order
// }
//}
//
//extension Legend: Hashable {
//    func hash(into hasher: inout Hasher) {
//     hasher.combine(color)
// }
//}
