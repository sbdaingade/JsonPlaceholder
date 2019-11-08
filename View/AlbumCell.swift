//
//  AlbumCell.swift
//  JSONPlaceholder
//
//  Created by Sachin Daingade on 07/11/19.
//  Copyright © 2019 Sachin Daingade. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {

    var cache = NSCache<AnyObject, AnyObject>()
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupCell(rowViewModel:ViewModel)
    {
        if let img = self.cache.object(forKey: rowViewModel.url as AnyObject) as? UIImage
        {
           
                self.imgView.image = img
          
        }else
        {
             DispatchQueue.main.async {
                let url = URL(string: rowViewModel.url)
                let req = URLRequest(url: url!)
                URLSession.shared.dataTask(with: req, completionHandler: { data, res, err in
                    
                    guard let data = data else {   return }
                    if let img = UIImage(data: data)
                   {
                    DispatchQueue.main.async {
                        self.imgView.image = img
                    }
                    self.cache.setObject(img, forKey:rowViewModel.url as AnyObject )
                    }
                }).resume()
            }
        }
        self.lblTitle.text = rowViewModel.title
    }
}
