//
//  MasterViewController.swift
//  FitEZ_Tuesday_Spring_2018
//
//  Created by Don Almeida on 4/3/18.
//  Copyright © 2018 Almeida Org. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var ExerciseArray = [Exercise]()


    func initializeArray() {
   
        //Rest API EndPoint to receive Exercices JSON
        let jsonURLString = "https://api.myjson.com/bins/dzny2"
        var jsonURL:URL = URL(string: jsonURLString)!
        
        let jsonUrlData = try? Data (contentsOf: jsonURL)
        
        print(jsonUrlData ?? "Error. No Data found at end point. Exiting.")
        
        if(jsonUrlData != nil){
            let dictionary:NSDictionary =
                (try! JSONSerialization.jsonObject(with: jsonUrlData!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
            print(dictionary)
        
            let Exersices = dictionary["Exercises"]! as! [[String:AnyObject]]
            
            for index in 0...Exersices.count - 1 {
                var exercise:Exercise = Exercise(exCategory:"", exName:"")
                
                var selectedExercise = Exersices[index]
                
                exercise.ExerciseName = selectedExercise["ExerciseName"] as! String
                exercise.ExerciseCategory = selectedExercise["ExerciseCategory"] as! String
                exercise.ExerciseID = selectedExercise["ExerciseID"] as! Int32
            exercise.ExerciseImageName = selectedExercise["ExerciseImageName"] as! String
           exercise.ExerciseURL = selectedExercise["ExerciseURL"] as! String
            
                ExerciseArray.append(exercise)
            }
        
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        initializeArray()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = ExerciseArray[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.destValue = object
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExerciseArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = ExerciseArray[indexPath.row]
        cell.textLabel!.text = object.ExerciseName
        cell.detailTextLabel!.text  = object.ExerciseCategory
        // Add images to the Cell
        let imgURL = URL(string:"http://www.protogic.com/images/" + (object.ExerciseImageName))
        let dataBytes = try? Data(contentsOf: imgURL!)
        let img = UIImage(data: dataBytes!)
        cell.imageView?.image = img
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView!.layer.cornerRadius = 10
        cell.imageView!.clipsToBounds = true
        // style the table view
        tableView.separatorColor = UIColor.lightGray
        tableView.tableFooterView = UIView(frame: CGRect(x:0.0, y:0.0, width:0.0, height:0.0))
        return cell
    
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }

    

}






