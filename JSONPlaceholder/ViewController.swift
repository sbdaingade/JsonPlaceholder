//
//  ViewController.swift
//  JSONPlaceholder
//
//  Created by Sachin Daingade on 06/11/19.
//  Copyright © 2019 Sachin Daingade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var arr = [ViewModel]()
    @IBOutlet weak var tblList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.vic
       self.getAlbumList()
    }

    func getAlbumList(){
        
        ServiceManager.sharedManager.getAlbums { [weak self] resultData, err in
            self?.arr = resultData!
            DispatchQueue.main.async {
                self?.tblList.reloadData()
            }
        }
    }
    

}
extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblList.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AlbumCell
        let vm = self.arr[indexPath.row]
        cell.setupCell(rowViewModel: vm)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
