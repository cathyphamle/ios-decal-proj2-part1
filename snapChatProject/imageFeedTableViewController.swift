//
//  imageFeedTableViewController.swift
//  snapChatProject
//
//  Created by Cathy Pham Le on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class imageFeedTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var imageFeedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageFeedTableView.delegate = self
        imageFeedTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.imageFeedTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return threads.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threads[threadNames[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageFeedCell", for: indexPath) as! imageFeedCell
        let snapObj = threads[threadNames[indexPath.section]]?[indexPath.row]
        cell.posterName.text = snapObj?.name
        cell.timeElapsed.text = String(Int((snapObj?.interval)!)) + " minutes"
        if (snapObj?.seen)! {
            cell.readStatus.image = UIImage(named: "read")
        } else {
            cell.readStatus.image = UIImage(named: "unread")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        threads[threadNames[indexPath.section]]?[indexPath.row].seen = true
        self.imageFeedTableView.reloadData()
    }

}
