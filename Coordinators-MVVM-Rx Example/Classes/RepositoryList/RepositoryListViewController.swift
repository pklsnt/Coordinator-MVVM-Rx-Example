//
//  RepositoryListViewController.swift
//  Coordinators-MVVM-Rx Example
//
//  Created by Arthur Myronenko on 6/29/17.
//  Copyright © 2017 Arthur Myronenko. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RepositoryListViewController: UIViewController {

    var viewModel: RepositoryListViewModel!

    @IBOutlet private weak var tableView: UITableView!

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = UITableViewAutomaticDimension

        viewModel.title
            .bind(to: navigationItem.rx.title)
            .disposed(by: disposeBag)

        viewModel.repositories
            .bind(to: tableView.rx.items(cellIdentifier: "RepositoryCell", cellType: RepositoryCell.self)) { (row, repo, cell) in
                cell.setName(repo.name)
                cell.setDescription(repo.description)
                cell.setStarsCountTest(repo.starsCountText)
            }
            .disposed(by: disposeBag)
    }
}