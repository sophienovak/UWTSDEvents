//
//  EventsTableViewController.swift
//  UWTSDEvents
//
//  Created by Sophie Novak on 09/05/2018.
//  Copyright © 2018 Sophie Novak. All rights reserved.
//

import UIKit
import UserNotifications

class EventsTableViewController: UITableViewController {
    
    
    var eventnames: [String] = []
    var eventdatetimes : [String] = []
    var eventlocations: [String] = []
    var photos: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
            
            let requestURL : URL = URL(string:"http://192.168.27.1/SOACphproot/Sophie/output.php")!
            
            let urlRequest:NSMutableURLRequest = NSMutableURLRequest(url: requestURL)
            
            let session=URLSession.shared
            let task=session.dataTask(with: urlRequest as URLRequest){data,response,error in
                let httpResponse=response as! HTTPURLResponse
                let statusCode=httpResponse.statusCode
                if (statusCode==200){
                    //NSLog("OK")
                    do{
                        let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                        if let results=json["events"] as? [[String:Any]]{
                            //print(json)
                            for events in results{
                                let en=events["eventname"] as! String
                                let ed=events["eventdateandtime"] as! String
                                let el=events["eventlocation"]as! String
                                let ph=events["eventphoto"]as! String
                                
                                //NSLog("Events:%@ %@ %@ %@", en,ed,el,ph)
                                
                                DispatchQueue.main.async(execute: {
                                    self.eventnames.append(en)
                                    self.eventdatetimes.append(ed)
                                    self.eventlocations.append(el)
                                    self.photos.append(ph)
                                })
                                
                            }//end for
                            
                            DispatchQueue.main.async(execute: {
                                self.tableView.reloadData()
                            })
                            
                            DispatchQueue.main.async(execute: {
                                var full=""
                                for i in (0..<self.eventnames.count)
                                {
                                    full=full+self.eventnames[i]+" "+self.eventdatetimes[i]+" ("+self.eventlocations[i]+")\n"
                                }
                                
                            })
                            
                            
                        }
                    }//end do
                    catch let err{
                        print (err.localizedDescription)
                    }
                }
            }
            task.resume()
            
            
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.eventnames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! EventsCustomCell
        cell.nameLabel?.text=eventnames[indexPath.row]
        
       cell.dateLabel?.text=eventdatetimes[indexPath.row]
        cell.locationLabel?.text=eventlocations[indexPath.row]

        let urlString="http://192.168.27.1/SOACphproot/Sophie/Images/"+photos[indexPath.row]
        let url=NSURL(string:urlString)
        let data=NSData(contentsOf:url! as URL)
        cell.eventImage.image=UIImage(data:data! as Data)
        
        // Configure the cell...

        return cell
    }
    

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
