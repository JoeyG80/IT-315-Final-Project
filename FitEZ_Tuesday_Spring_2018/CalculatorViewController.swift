//
//  CalculatorViewController.swift
//  FitEZ_Tuesday_Spring_2018
//
//  Created by user134481 on 5/10/18.
//  Copyright © 2018 Almeida Org. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var PerimeterLength1: UITextField!
    @IBOutlet weak var PerimeterWidth1: UITextField!
    @IBOutlet weak var PerimeterTotal: UITextView!
    @IBOutlet weak var PerimeterCalculate: UIButton!
    
    @IBAction func goToPerimeter(_ sender: UIButton) {
        let YARD = 36
        let SIDES = 2
        let length  = (PerimeterLength1.text! as NSString).integerValue
        let width = (PerimeterWidth1.text! as NSString).integerValue
        let perimeter = ((length * SIDES) + (width * SIDES)) / YARD
        PerimeterTotal.text = String(perimeter) + " yard(s)"
    }
    
    
    @IBOutlet weak var PerimeterLength2: UITextField!
    @IBOutlet weak var PerimeterWidth2: UITextField!
    @IBOutlet weak var Answer: UITextView!
    @IBOutlet weak var calculateNumSquares: UIButton!
    
    @IBAction func goToNumSquares(_ sender: UIButton) {
        let length  = (PerimeterLength1.text! as NSString).integerValue
        let width = (PerimeterWidth1.text! as NSString).integerValue
        let length2  = (PerimeterLength2.text! as NSString).integerValue
        let width2 = (PerimeterWidth2.text! as NSString).integerValue
        let area1 = length * width
        let area2 = length2 * width2
        if(!(area1 == 0) && !(area2 == 0)){
            let numSquares = area1 / area2
            if((area1 % area2) > 0){
                Answer.text = "The number of squares does not go evenly"
            }
            else{
                Answer.text = String(numSquares) + " square(s) will"
            }
        }
    }

    
    
    @IBAction func onGoBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
