//
//  BreedsViewController.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper
import GKRepresentable

protocol ListViewInput: ViperViewInput {
    func updateSections(_ sections: [TableSectionModel])
}

protocol ListViewOutput: ViperViewOutput {
    func selectedSell(_ cellModel: TableCellIdentifiable)
}

class BreedsViewController: ViperViewController, ListViewInput {
    
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Props
    fileprivate var output: ListViewOutput? {
        guard let output = self._output as? ListViewOutput else { return nil }
        return output
    }
    
    var sections: [TableSectionModel] = []
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = AppLocalization.Breeds.title.loc
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.registerCellNib(BreedCell.self)
    }
    
    func setupActions() { }
    
    func applyStyles() {
        self.view.apply(.asBackground())
        self.tableView.apply(.standart())
    }
    
    // MARK: - ListViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
    func updateSections(_ sections: [TableSectionModel]) {
        self.sections = sections
        
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            
            strongSelf.tableView.reloadData()
        }
    }
}

// MARK: - Actions
extension BreedsViewController { }

// MARK: - Module functions
extension BreedsViewController { }

// MARK: - UITableViewDataSource
extension BreedsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let count = self.sections.count
        return count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.sections[section].rows.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.sections[indexPath.section].rows[indexPath.row]
        
        if model is BreedCellModel {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier) as? BreedCell else { return UITableViewCell() }
            cell.model = model
            return cell
        }
        
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension BreedsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellModel = self.sections[indexPath.section].rows[indexPath.row]
        self.output?.selectedSell(cellModel)
    }
}
