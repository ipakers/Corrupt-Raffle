//
//  RaffleViewController.swift
//  Corrupt Raffle
//
//  Created by Isaac Perry on 6/17/16.
//  Copyright © 2016 Isaac Perry. All rights reserved.
//

import UIKit
import Foundation
class RaffleViewController: UIViewController {
    @IBOutlet weak var raffleItemLabel: UILabel!
    @IBOutlet weak var remainingItemsLabel: UILabel!
    @IBAction func putItBack(sender: UIBarButtonItem) {
        setRandomRaffleItem()
    }
    
    @IBAction func getTheFuckOut(sender: UIBarButtonItem) {
        raffleItems.removeAtIndex(currentIndex)
        if raffleItems.count == 1 {
            performSegueWithIdentifier("winnerSegue", sender: self)
        } else {
            setRandomRaffleItem()
        }
    }
    
    
    var currentIndex = 0
    var raffleItems = [RaffleItem]()
    var remainingItems:Int {
        get {
            return raffleItems.count
        }
        set {
            remainingItemsLabel.text = "Remaining items: \(newValue)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setRandomRaffleItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setRandomRaffleItem() {
        let count = UInt32(raffleItems.count)
        if count > 0 {
            let index = Int(arc4random_uniform(count))
            raffleItemLabel.text = raffleItems[index].title
            remainingItems = raffleItems.count
            currentIndex = index
        }
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let destinationVC = segue.destinationViewController as! WinnerViewController
        destinationVC.winnerTitle = raffleItems[0].title
    }


}
