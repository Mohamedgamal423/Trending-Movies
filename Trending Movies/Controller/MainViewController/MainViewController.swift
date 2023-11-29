//
//  MainViewController.swift
//  Trending Movies
//
//  Created by Mohamed on 28/11/2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: MainViewModel = MainViewModel()
    var cellDataSource: [MovieTableCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        bindViewModel()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    func configView(){
        title = "Main"
        setTable()
    }
    func bindViewModel(){
        viewModel.isLoading.bind { [weak self]isLoading in
            guard let slf = self, let isLoading = isLoading else{
                return
            }
            DispatchQueue.main.async {
                if isLoading{
                    slf.activityIndicator.startAnimating()
                }else{
                    slf.activityIndicator.stopAnimating()
                }
            }
        }
        viewModel.cellDataSource.bind {[weak self]movies in
            guard let slf = self, let movies = movies else{
                return
            }
            slf.cellDataSource = movies
            DispatchQueue.main.async {
                slf.tableview.reloadData()
            }
        }
    }

}
extension MainViewController: UITableViewDataSource, UITableViewDelegate{
    
    func setTable(){
        tableview.dataSource = self
        tableview.delegate = self
        tableview.backgroundColor = .clear
        tableview.register(UINib(nibName: "Moviecell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! Moviecell
        cell.setCell(viewmodel: cellDataSource[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
