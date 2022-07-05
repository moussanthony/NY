//
//  NetworkManager.swift
//  NY Times
//
//  Created by anthony moussa on 04/07/2022.
//

import Foundation

func ParsingJson(completion: @escaping ([Article])->()) {
    
    let urlString = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/30.json?api-key=DeOSDJMsjY2fEWnPQCge83iVh0UC7OgG"
    let url = URL(string: urlString)
    
    guard url != nil else {
        print("error")
        return
    }
    
    let session = URLSession.shared
    let dataTask = session.dataTask(with: url!) { data, response, error in
        if error == nil , data != nil {
            let decoder = JSONDecoder()
            do {
                let ParsingData = try decoder.decode(NewsApi.self, from: data!)
                completion(ParsingData.results)
            }
         catch {
            print("Parse error")
            }
        }
    }
    dataTask.resume()
}


