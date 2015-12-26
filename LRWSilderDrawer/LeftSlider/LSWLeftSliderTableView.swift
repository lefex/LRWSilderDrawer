//
//  LeftSliderTableView.swift
//  LeftSlider
//
//  Created by wsy on 15/9/4.
//  Copyright (c) 2015年 WSY. All rights reserved.
//

import UIKit

class LSWLeftSliderTableView: UIView, UITableViewDelegate, UITableViewDataSource {

    var tableView :UITableView!
    let identifer :String = "ID"

    var dataArray :NSMutableArray!
    
    weak var delegate: LeftTableViewRowClickDelegate?
    
    init(frame: CGRect ,cellConfigures: NSMutableArray){
        super.init(frame: frame)
        self.dataArray = cellConfigures;
        tableView = createTableView();
        self.addSubview(tableView);
    }
    
    func createTableView() -> UITableView{
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height), style: UITableViewStyle.Plain);
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.tableFooterView = UIView();
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        return tableView;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(identifer) as? LSWLeftSliderCell
        if (cell == nil){
            cell = LSWLeftSliderCell(style: UITableViewCellStyle.Default, reuseIdentifier: "ID")
        }
        cell?.loadDataWithLeftCellConfigure(self.dataArray[indexPath.row] as! LSWLeftCellConfigure);
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        changeRedIconState(indexPath)
        self.delegate!.leftTableRowClickIndex(indexPath.row)
    }
    
    private func changeRedIconState(indexPath: NSIndexPath){
        for (var i = 0 ; i < self.dataArray.count; i++){
            let configure: LSWLeftCellConfigure = self.dataArray[i] as! LSWLeftCellConfigure;
            configure.isSelected = false
        }
        let cellConfig: LSWLeftCellConfigure = self.dataArray[indexPath.row] as! LSWLeftCellConfigure
        cellConfig.isSelected = true
        tableView.reloadData()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
