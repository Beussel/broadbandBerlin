//
//  NetworkManager.swift
//  Belegarbeit
//
//  Created by Ali on 28.05.18.
//  Copyright © 2018 Ali. All rights reserved.
//

import Foundation

struct NetworkManager{
   // var URl: URL
    
    func getDataFromApi(bezirk: String, completion: @escaping (Result?) -> Void){
        //Ersetzt '-' mit leerzeile, da die Api keine Bindestriche akzeptiert 
        let urlString = "https://www.berlin.de/sen/wirtschaft/wirtschaft/branchen/ikt-medien-kreativwirtschaft/breitband/privatverfuegbarkeit/alle-technologien/index.php/index/all.json?q=\(bezirk.replacingOccurrences(of: "-", with: " "))"
        let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let url = URL(string: encoded!)
        if let url = url {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error)
                } else {
                    if let usableData = data {
                        let result = try? JSONDecoder().decode(Result.self, from: usableData)
                        completion(result)
                    }
                }
            }
            task.resume()
        }
    }
}
