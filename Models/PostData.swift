//
//  PostData.swift
//  NY Times
//
//  Created by anthony moussa on 04/07/2022.
//

import Foundation

struct NewsApi: Decodable {
    var status: String
    var copyright: String
    var num_results: Int
    var results: [Article]
}
    
struct Article: Decodable {
    var byline: String?
    var type: String?
    var published_date: String?
    var abstract: String?
    var updated: String?
    var title: String?
}
