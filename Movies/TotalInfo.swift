//import Foundation
//import SwiftyJSON
//
//struct TotalInfo {
//  let page: Int
//  let total_results: Int
//  let total_pages: Int
//  var results: ResultsInfo?
//
//  init(json: JSON) {
//    self.page = json["page"].intValue
//    self.total_pages = json["total_results"].intValue
//    self.total_results = json["total_pages"].intValue
//    self.results = ResultsInfo.init(json: json["results"])
//
//    for num in 0..<json["results"].count {
//      let resultsInfo = json["results"][num]
//      self.results = ResultsInfo.init(json: resultsInfo)
//    }
//  }
//}
