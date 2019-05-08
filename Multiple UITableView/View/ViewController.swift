//
//  ViewController.swift
//  Multiple UITableView
//
//  Created by NP2 on 5/8/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    private var cities = Array<CitiesModel>()
    private var infoes = Array<InfoModel>()

    private lazy var presenter:Presenter = {
        let temp = Presenter(view: self)
        return temp
    }()
    
    @IBOutlet private weak var citiesTableView:UITableView! {
        didSet {
            citiesTableView.delegate = self
            citiesTableView.dataSource = self
            citiesTableView.register(UINib(nibName: "CitiesTVC", bundle: nil), forCellReuseIdentifier: "CitiesTVC")
        }
    }
    @IBOutlet private weak var infoTableView:UITableView! {
        didSet {
            infoTableView.delegate = self
            infoTableView.dataSource = self
            infoTableView.estimatedRowHeight = 139
            infoTableView.register(UINib(nibName: "InfoTVC", bundle: nil), forCellReuseIdentifier: "InfoTVC")
        }
    }  
}

// MARK: - Life Cycle

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getCities()
    }
}

// MARK: - TableView DataSource Delegate

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == citiesTableView {
            return cities.count
        } else {
            return infoes.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == citiesTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CitiesTVC") as! CitiesTVC
            cell.fill(cell: cities[indexPath.row])
            return cell
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTVC") as! InfoTVC
            cell.fill(cell: infoes[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == citiesTableView {
            return 45
        } else {
            return UITableView.automaticDimension
        }
    }
}

// MARK: - Presenter Impelementation

extension ViewController: View {
    func setCities(with object: [CitiesModel]) {
        cities = object
        citiesTableView.reloadData()
    }
    
    func setInfo(with object: [InfoModel]) {
        infoes = object
        infoTableView.reloadData()
    }
}

