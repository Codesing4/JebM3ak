//
//  ListTable.swift
//  JebM3ak
//
//  Created by Qahtan on 11/30/17.
//  Copyright © 2017 Codesign4. All rights reserved.
//

import UIKit

class ListTable: UIViewController {

    var theRoot : TheRoot!
    let cellId = "cellId"
//    @IBOutlet weak var list: UITableView!
    let list : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        print("theRoot.arrayOfItems",theRoot.arrayOfItems)
        print("viewDidLoad in the List Table ")
    }
    
    
    func configureTable () {
        
        
        ///***** here we obsorve the data in the FireDataBase ******///
        view.addSubview(list)
        list.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        list.dataSource  = self
        list.delegate = self
        
        list.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        list.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        list.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        list.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension ListTable : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = theRoot.arrayOfItems[indexPath.row]
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theRoot.arrayOfItems.count
    }
}
