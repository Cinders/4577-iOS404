//
//  CourseMainController.swift
//  iOSapp
//
//  Created by Mae on 2015-02-28.
//  Copyright (c) 2015 Team 404. All rights reserved.
//

import UIKit

class CourseMainController: UIViewController
{
    @IBOutlet weak var choiceLabel: UILabel!
    @IBOutlet weak var segmentController: UISegmentedControl!

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var newsView: UIView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var infoWebView: UIWebView!
    
    var courseNo: String!
    var courseName: String!
    var instrName: String!
    var instrEmail: String!
    var office: String!
    var officeHrs: String!
    var breakdown: String!
    
    
    @IBAction func segmentChanged(sender: UISegmentedControl)
    {
        switch 	segmentController.selectedSegmentIndex
        {
            // news view (default view)
            case 0 :
                self.newsView.hidden = false;
                self.infoView.hidden = true;
                choiceLabel.text = 	"News and stuff"
                break
            // info view
            case 1 :
                self.newsView.hidden = true;
                self.infoView.hidden = false;
                //choiceLabel.text = "Info about the course"
                infoLabel.text = " Instructor: \n\t \(instrName) \n\t \(instrEmail) \n\t \(office) \n\n Office Hours: \(officeHrs) \n\n Evaluation Breakdown: \(breakdown)"
                break
            default :
                break
        }

    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        courseNo = "COMP 4711"
        instrName = "Jim Parry"
        instrEmail = "jim_parry@bcit.ca"
        office = "SW2 124"
        officeHrs = "\n\t T: 1:30 - 2:30 \n\t Th: 1:30 - 3:30"
        breakdown = "\n\t Assignments 25% \n\t Labs 30% \n\t Midterm 20% \n\t Final Exam 25%"
        
        let localFile = NSBundle.mainBundle().URLForResource("info", withExtension: "html")
        let myRequest = NSURLRequest(URL: localFile!);
        infoWebView.loadRequest(myRequest)
        
        
        // set the navigation bar title to show the course
        self.navigationItem.title = courseNo
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var addButton: UIButton!
    @IBAction func addNews(sender: AnyObject) {
        let alertController : UIAlertController = UIAlertController(
            title: "Add News", message: "", preferredStyle: .Alert);
        
        let newsAction = UIAlertAction(title: "Add", style: .Default) { (_) in
            let titleTextField = alertController.textFields![0] as UITextField
            let newsTextField = alertController.textFields![1] as UITextField
            
            self.add(titleTextField.text, news: newsTextField.text)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in
            println("cancel")
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Title"
        }
        
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "News"
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(newsAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func add(title: String, news: String) {
        println("Title: \(title) with news: \(news)")
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
