//
//  UIImageView+DownloadImage.swift
//  SS9
//
//  Created by 沈松青 on 2017/7/7.
//  Copyright © 2017年 沈松青. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImage(url: URL) -> URLSessionDownloadTask {
        let session = URLSession.shared
        
        let downloadTask = session.downloadTask(with: url, completionHandler: {
            [weak self] url, response, error in
            
            if error == nil, let url = url, let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    if let strongself = self {
                        strongself.image = image
                    }
                }
            }
        })
        
        downloadTask.resume()
        return downloadTask
    }
}
