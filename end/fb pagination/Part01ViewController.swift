//
//  ViewController.swift
//  fb pagination
//
//  Created by Ymmanuel on 4/20/17.
//  Copyright © 2017 Hedgehog Labs. All rights reserved.
//

import UIKit
import Firebase


class Part01ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    var datasource = [Player]()
    var currentScore:Int!
    var currentKey:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPlayer()
    }
    
    func getPlayer(){
        
        if currentKey == nil{
            FIRDatabase.database().reference().child("players").queryOrdered(byChild: "score").queryLimited(toLast: 5).observeSingleEvent(of: .value) { (snap:FIRDataSnapshot) in
                
                
                
                if snap.childrenCount > 0 {
                    
                    let first = snap.children.allObjects.first as! FIRDataSnapshot
                    
                    for s in snap.children.allObjects as! [FIRDataSnapshot]{
                        let item = s.value as! Dictionary<String,AnyObject?>
                        let player = Player(key: s.key , dictionary: item as Dictionary<String,AnyObject>)
                        self.datasource.insert(player, at: 0)
                    }
                    
                    self.currentKey = first.key
                    self.currentScore = first.childSnapshot(forPath: "score").value as! Int
                    
                    self.table.reloadData()
                }
            }
        }else{
            
            FIRDatabase.database().reference().child("players").queryOrdered(byChild: "score").queryEnding(atValue: self.currentScore).queryLimited(toLast: 6).observeSingleEvent(of: .value , with: { (snap:FIRDataSnapshot) in
                
                
                let index = self.datasource.count
                
                if snap.childrenCount > 0 {
                    
                    let first = snap.children.allObjects.first as! FIRDataSnapshot
                    
                    for s in snap.children.allObjects as! [FIRDataSnapshot]{
                        
                        if s.key != self.currentKey{
                            let item = s.value as! Dictionary<String,AnyObject?>
                            let player = Player(key: s.key , dictionary: item as Dictionary<String,AnyObject>)
                            self.datasource.insert(player, at: index)
                        }
                        
                    }
                    
                    self.currentKey = first.key
                    self.currentScore = first.childSnapshot(forPath: "score").value as! Int
                    
                    self.table.reloadData()
                }
                
            })
        }
    }
}

extension Part01ViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "player_cell", for: indexPath) as! PlayerTableViewCell
        
        let player = self.datasource[indexPath.row]
        cell.player = player
        
        return cell
    }
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffset = scrollView.contentOffset.y
        let maxOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        if maxOffset - currentOffset <= 40{
            getPlayer()
        }
    }
    
}




