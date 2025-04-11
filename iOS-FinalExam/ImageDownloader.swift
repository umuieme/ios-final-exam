//
//  ImageDownloader.swift
//  iOS-FinalExam
//
//  Created by Umesh Basnet on 11/04/2025.
//

import Foundation


class ImageDownloader {
    static func downloadImage( imagePath : String, completion : @escaping (_ error: String?, _ imageData: Data?) -> Void) {
        let url = URL(string: imagePath)!
        
        let imageQueue = DispatchQueue(label: "image-download-queue");
        imageQueue.async {
            do {
                let imageData = try Data(contentsOf: url);
                DispatchQueue.main.async {
                    completion(nil, imageData)
                }
            } catch {
                completion(error.localizedDescription, nil)
            }
        }
    }
}
