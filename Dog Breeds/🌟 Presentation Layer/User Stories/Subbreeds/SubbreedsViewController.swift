//
//  SubbreedsViewController.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper
import GKRepresentable

protocol SubbreedsViewInput: ViperViewInput {
    func updateSections(_ sections: [TableSectionModel])
}

protocol SubbreedsViewOutput: ViperViewOutput {
    func selectedCell(_ cellModel: TableCellIdentifiable)
}

class SubbreedsViewController: ViperViewController, SubbreedsViewInput {
    
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Props
    fileprivate var output: SubbreedsViewOutput? {
        guard let output = self._output as? SubbreedsViewOutput else { return nil }
        return output
    }
    
    var sections: [TableSectionModel] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.contentInsetAdjustmentBehavior = .never
    }
    
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = ""
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.tableView.registerCellNib(SubbreedCell.self)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func setupActions() { }
    
    func applyStyles() {
        self.view.apply(.asBackground())
        self.tableView.apply(.standart())
    }
    
    // MARK: - SubbreedsViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
        
        guard let viewModel = viewModel as? SubbreedsViewModel else { return }
        self.navigationItem.title = viewModel.breed.breed.capitalized
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
extension SubbreedsViewController { }

// MARK: - Module functions
extension SubbreedsViewController { }

// MARK: - UITableViewDataSource
extension SubbreedsViewController: UITableViewDataSource {
    
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
        
        if model is SubbreedCellModel {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier) as? SubbreedCell else { return UITableViewCell() }
            cell.model = model
            return cell
        }
        
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension SubbreedsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellModel = self.sections[indexPath.section].rows[indexPath.row]
        self.output?.selectedCell(cellModel)
    }
}
