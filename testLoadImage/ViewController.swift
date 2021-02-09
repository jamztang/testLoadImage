//
//  ViewController.swift
//  testLoadImage
//
//  Created by James Tang on 9/2/2021.
//

import UIKit
//import CoreImage
import ImageIOSwift
import SDWebImageWebPCoder


class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.


    }

    @IBAction func loadButtonDidPress(_ sender: Any) {

        guard let path = Bundle.main.path(forResource: "jpg2k", ofType: "") else {
            fatalError("no resources")
        }

        // 1. UIImage.contentsOfFile
//        let image = UIImage(contentsOfFile: path) // failed

        // 2. data -> UIImage
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
//        let image = UIImage(data: data) // failed

        // 3. load with CIImage also failed
//        let ciImage = CIImage(contentsOf: url)!
//        let image = UIImage(cgImage: ciImage.cgImage!)

        // 4. load with ImageIOSwift
//        let imageSource = ImageIOSwift.ImageSource(url: url)
//        Swift.print("TTT properties \(imageSource?.properties())")
//        let cgImage = imageSource?.cgImage()
//        let image = UIImage(cgImage: cgImage!)


        // 5. load with SDWebImageWebPCoder

        let image = SDImageWebPCoder.shared.decodedImage(with: data, options: nil)
        imageView.image = image
    }

    @IBAction func clearButtonDidPress(_ sender: Any) {
        imageView.image = nil
    }
}

