//
//  chooseFeedTableViewController.swift
//  snapChatProject
//
//  Created by Cathy Pham Le on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class chooseFeedTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var chooseFeedTableView: UITableView!
    
    @IBOutlet weak var feedName: UILabel!
    
    @IBOutlet weak var sendButton: UIButton!
    
    var imagePicked: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseFeedTableView.delegate = self
        chooseFeedTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //used andrewbancroft.com for help
    @IBAction func sendPicture(_ sender: UIButton) {
        let alert = UIAlertController(title: "Image was posted", message: "", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
            (_)in
            self.performSegue(withIdentifier: "unwindBack", sender: self)
        })
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "typeFeedCell", for: indexPath) as! typeFeedCell
        let type = threadNames[indexPath.row]
        cell.feedLabel.text = type
        return cell
    }
    
    func tableView(_ collectionView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fd = threadNames[indexPath.row]
        feedName.text = fd
        let newSnap = Snap(img: imagePicked!, user: "Cathy Pham Le")
        newSnap.start()
        threads[fd]?.append(newSnap)
    }
    
}
