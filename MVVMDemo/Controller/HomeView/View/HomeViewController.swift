//
//  HomeViewController.swift
//  MVVMDemo
//
//  Created by Puran on 20/07/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var _tblview:UITableView!
    private var viewModel : EmployeeViewModel!
    private var dataSource : EmployeeTableViewDataSource<EmployeeTableViewCell, EmployeeData>!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "HOME"
        _tblview.register(UINib.init(nibName: "EmployeeTableViewCell", bundle: nil), forCellReuseIdentifier: "EmployeeTableViewCell")
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
        
        self.viewModel =  EmployeeViewModel()
        self.viewModel.bindEmployeeViewModelToController = {
            self.updateDataSource()
        }
    }
    func updateDataSource(){
        
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "EmployeeTableViewCell", items: self.viewModel.empData.data, configureCell: { (cell, evm) in
            cell.employeeIdLabel.text = "\(evm.id)"
            cell.employeeNameLabel.text = evm.employeeName
        })
        
        DispatchQueue.main.async {
            self._tblview.dataSource = self.dataSource
            self._tblview.reloadData()
        }
    }
}
