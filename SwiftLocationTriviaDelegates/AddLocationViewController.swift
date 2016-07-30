//
//  AddLocationViewController.swift
//  SwiftLocationTriviaDelegates
//
//  Created by Henry Dinhofer on 7/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit


//adding "class" to the end means that the protocol can only be adoped by classes, and not structs or enums.  This is for memory management purposes.
protocol AddLocationViewControllerDelegate: class {
    // originally tried to name protocol functions:
    //    optional func userDidTapCancel()
    //    optional func submittedCreateableLocation(location:
    
    
    //argument to addLocationViewController is argument for the sender: AddLocationViewController
    func addLocationViewControllerDidCancel (viewController: AddLocationViewController)
    func addLocationViewController(viewController: AddLocationViewController, shouldAllowLocationNamed name: String) -> Bool
    func addLocationViewConntroller(viewController: AddLocationViewController, didAddLocationNamed name: String)
    
}

class AddLocationViewController: UIViewController {

    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    //almost always make delegate properties weak
    weak var delegate: AddLocationViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func locationHasBeenEntered(sender: AnyObject) {
        guard let locationText = self.locationTextField?.text else {return}
        
        
        if self.delegate?.addLocationViewController(self, shouldAllowLocationNamed: locationText) == true {
            saveButton.enabled = true
        }else {
            saveButton.enabled = false
        }
    }
    

    @IBAction func saveButtonTapped(sender: AnyObject) {
        guard let locationText = self.locationTextField?.text else {return}
        self.delegate?.addLocationViewConntroller(self, didAddLocationNamed: locationText)
        
    }

    @IBAction func cancelButtonTapped(sender: AnyObject) {
        locationTextField?.text = ""
        
        //If somebody takes on the responsibility of being a delegate, this will be entered fn called
        if self.delegate != nil {
            print("delegate inside cancel")
            self.delegate?.addLocationViewControllerDidCancel(self)
        }
//        self.delegate?.addLocationViewControllerDidCancel(self)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
