//
//  TableViewDataSource.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/11/23.
//

import UIKit

class TableViewDataSource<T: TableViewCell>: NSObject, UITableViewDataSource, UITableViewDelegate {

    var cellHeight: CGFloat?
    var items: [T.CellViewModel] = []
    var tableView: UITableView

    init(cellHeight: CGFloat? = nil,
         items: [T.CellViewModel],
         tableView: UITableView) {
        self.cellHeight = cellHeight
        self.items = items
        self.tableView = tableView
        
        if cellHeight == 0 || cellHeight == nil {
            self.tableView.estimatedRowHeight = UITableView.automaticDimension
            self.tableView.rowHeight = UITableView.automaticDimension
        }
        
        let nib = UINib(nibName: String(describing: T.self), bundle: nil)
        self.tableView.register(nib,
                                forCellReuseIdentifier: String.init(describing: T.self))
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String.init(describing: T.self),
                                                 for: indexPath) as? T
        cell?.configureCellWith(items[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellheight = cellHeight,
              cellHeight != 0 else { return UITableView.automaticDimension }
        return cellheight
    }
    
    func appendItemsToTableView( _ newItems: [T.CellViewModel]) {
        let lastItem = self.items.count
        self.items.append(contentsOf: newItems)
        let indexPaths = newItems.enumerated().map { (index, _) in
            IndexPath(item: lastItem + index, section: 0)
        }
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: indexPaths, with: .automatic)
        self.tableView.endUpdates()
    }
    
    func refreshWithNewItems(_ newItems: [T.CellViewModel]) {
        self.items = newItems
        self.tableView.reloadData()
    }
}
