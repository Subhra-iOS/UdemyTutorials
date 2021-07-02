//
//  ListViewController.swift
//  UdemyAlgoDemo
//
//  Created by Subhra Roy on 28/06/21.
//  Copyright © 2021 Subhra Roy. All rights reserved.
//

import UIKit
import Combine

class ListViewController: UIViewController {
    private var listViewModel: ListViewModel!
    private var obaservers: [AnyCancellable] = [AnyCancellable]()
    private var companies: [ListCellViewModel]?
    
    private var tableView: UITableView = {
       let table = UITableView()
        table.register(ListTableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private func initViewModel(){
        let _networkManager = NetworkManager(network: Networker(), cancelable: Set<AnyCancellable>())
        listViewModel = ListViewModel(api: APIHandler(networkManager: _networkManager))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
        self.tableView.frame = view.bounds
        self.tableView.dataSource = self
        self.initViewModel()
        listViewModel.fetchServiceData()
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { (completion) in
            switch completion {
                case .finished: print("End of operation")
                case .failure( let error): print("\(error)")
            }
        }, receiveValue: { [weak self] value in
            self?.companies = self?.listViewModel.convertCellViewModel(value)
            self?.tableView.reloadData()
        }).store(in: &obaservers)
    }
    
    deinit {
        obaservers.removeAll()
        print("ListViewController  deinit")
    }

}

extension ListViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let array = self.companies, array.count > 0 { return array.count }
        else { return 0 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let listCell: ListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
          as? ListTableViewCell,
          let array = self.companies else {
           fatalError()
        }
        if array.count > 0{
            listCell.listCellModel = array[indexPath.row]
            listCell.publisher.sink { (name) in
                print("Company name is : \(name)")
            }.store(in: &obaservers)
        }
        return listCell
    }
}

extension ListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
