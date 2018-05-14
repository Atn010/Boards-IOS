//
//  MainBoardTVC.swift
//  Money Board
//
//  Created by Antonius George on 08/05/18.
//  Copyright © 2018 Apple Developer Academy @ Binus. All rights reserved.
//

import UIKit

class MainBoardTVC: UITableViewController, UIViewControllerPreviewingDelegate{
    
    
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard let peek = storyboard?.instantiateViewController(withIdentifier: "SubBoard") as? SubBoardTVC else {return nil}
        
        if let indexPath = tableViewUI.indexPathForRow(at: location){
            peek.title = Data.mainBoardText[indexPath.row]
            print(peek.title!)
            Data.subBoardPageTitle = Data.mainBoardText[indexPath.row]
        }
        
        
        
        return peek
        
        
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        
        show(viewControllerToCommit, sender: self)
    }
    
    
    @IBOutlet var tableViewUI: UITableView!
    let Data = DataStore.shared

    override func viewDidLoad() {
        super.viewDidLoad()
 
        registerForPreviewing(with: self, sourceView: tableViewUI)
        tableViewUI.dataSource = self
        tableViewUI.estimatedRowHeight = 90
        tableViewUI.rowHeight = UITableViewAutomaticDimension
        
        self.title = "Money"
        let addButton = UIBarButtonItem(barButtonSystemItem:  .add, target: self, action: #selector(addNew))
        //let backIcon = UIBarButtonItem(
        
        self.navigationItem.rightBarButtonItem = addButton
        //self.navigationItem.leftBarButtonItem = backIcon

        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Reloading Data")
        //Data.loadBoard()
        tableViewUI.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func returnBack(){
       self.navigationController?.popViewController(animated: true)
    }
    
    @objc func addNew(){
        performSegue(withIdentifier: "toAddition", sender: self)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Data.mainBoardImage.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:indexPath) as! MainBoardTVCell
        
        
        cell.MainBoardCellImage.image = Data.mainBoardImage[indexPath.row]
        cell.MainBoardCellText.text = Data.mainBoardText[indexPath.row]
    
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       Data.subBoardPageTitle = Data.mainBoardText[indexPath.row]
        
         print("Now Preparing For Segue For \(Data.mainBoardText[indexPath.row]) - \(indexPath.row)")

        
        
        performSegue(withIdentifier: "toSubBoard", sender: self)
    }
    func addMenuItems(menu:String ...) -> [UIPreviewActionItem] {
        var arrPreview = [UIPreviewActionItem]()
        for m in menu {
            let likeAction = UIPreviewAction(title:m, style: .default) { (action, viewController) -> Void in
                print(action.title)
            }
            arrPreview.append(likeAction)
        }
        return arrPreview
    }
    
    // Add Action of preview
    override var previewActionItems: [UIPreviewActionItem] {
        return self.addMenuItems(menu: "Open","Bookmark")
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //objects.remove(at: indexPath.row)
            Data.subBoardImage.removeValue(forKey: Data.mainBoardText[indexPath.row])
            Data.mainBoardImage.remove(at: indexPath.row)
            Data.mainBoardText.remove(at: indexPath.row)
            tableViewUI.deleteRows(at: [indexPath], with: .fade)
            
            DispatchQueue.global(qos: .userInitiated).async {
                self.Data.saveBoard()
            }
        }
    }
    

    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
