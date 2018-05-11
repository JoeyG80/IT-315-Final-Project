//
//  DetailViewController.swift
//  This App is developed as an education project
//  Certain materials are included under the fair use exemption of the U.S. Copyright law
//  and have been prepared according to the multimedia fair use guidelines and are restricted
//  from further use
//
//  Created by Joseph Greenfield.
//
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgImage: UIImageView!
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    @IBAction func OnGoButton(_ sender: Any) {
        performSegue(withIdentifier: "calcSegue", sender: self)
    }
    

    


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
        let imgURL = URL(string:"http://mason.gmu.edu/~jgreenf2/Pictures/" + (destValue?.ExerciseImageName)!)
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





