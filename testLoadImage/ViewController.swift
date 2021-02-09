//
//  ViewController.swift
//  testLoadImage
//
//  Created by James Tang on 9/2/2021.
//

import UIKit

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
        let image = UIImage(contentsOfFile: path)

        imageView.image = image
    }

    @IBAction func clearButtonDidPress(_ sender: Any) {
        imageView.image = nil
    }
}

