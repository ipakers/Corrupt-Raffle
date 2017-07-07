//
//  WinnerViewController.swift
//  Corrupt Raffle
//
//  Created by Isaac Perry on 6/17/16.
//  Copyright © 2016 Isaac Perry. All rights reserved.
//

import UIKit

class WinnerViewController: UIViewController {
    
    var winnerTitle = ""
    
    @IBAction func navigateHome(sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBOutlet weak var winnerLabel: UILabel!
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        winnerLabel.text = "\(winnerTitle) is the Winner!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        self.navigationController?.navigationBarHidden = false
        super.viewWillDisappear(animated)
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
