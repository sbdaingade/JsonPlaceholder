
//
//  ServiceManager.swift
//  JSONPlaceholder
//
//  Created by Sachin Daingade on 06/11/19.
//  Copyright © 2019 Sachin Daingade. All rights reserved.
//

import Foundation
final class ServiceManager {
    
    static let sharedManager = ServiceManager()
    
    
    func getAlbums(complitionHandler: @escaping ([ViewModel]?, Error?)-> Void )
    {
        let str = "https://jsonplaceholder.typicode.com/photos"
        let url = URL(string: str)
        let req = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: req) { data, response, err in
            
            if let err = err
            {
                complitionHandler(nil,err)
            }
            guard let data = data else{
                return
            }
            
            do{
                var arr = [ViewModel]()
                let result = try! JSONDecoder().decode([Model].self, from: data)
                arr = result.map({return ViewModel(result: $0)})
              //  print(arr.last?.title)
                complitionHandler(arr,err)
                
            }catch {
                
                print(err?.localizedDescription)
            }
            
            
            
        }.resume()
        
        
        
    }
    
}
