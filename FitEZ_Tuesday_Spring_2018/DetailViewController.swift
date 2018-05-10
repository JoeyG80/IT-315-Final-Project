//
//  DetailViewController.swift
//  FitEZ_Tuesday_Spring_2018
//
//  Created by Don Almeida on 4/3/18.
//  Copyright © 2018 Almeida Org. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgImage: UIImageView!
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let label = detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        detailDescriptionLabel.text = destValue?.ExerciseName
        let imgURL = URL(string:"http://www.protogic.com/images/" + (destValue?.ExerciseImageName)!)
        let dataBytes = try? Data(contentsOf: imgURL!)
        let img = UIImage(data: dataBytes!)
        imgImage?.image = img
        imgImage?.contentMode = .scaleAspectFill
        imgImage?.layer.cornerRadius = 10
        imgImage?.clipsToBounds = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: NSDate? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSubView" {
           let destController = segue.destination as! SubViewController
            destController.justThinking = destValue!
        }
    }
    var destValue:Exercise?
}





