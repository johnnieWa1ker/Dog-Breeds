//
//  DetailViewController.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol DetailViewInput: ViperViewInput {
    func updateSections(_ sections: [CollectionSectionModel])
}

protocol DetailViewOutput: ViperViewOutput { }

class DetailViewController: ViperViewController, DetailViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Props
    fileprivate var output: DetailViewOutput? {
        guard let output = self._output as? DetailViewOutput else { return nil }
        return output
    }
    
    var sections: [CollectionSectionModel] = []
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = ""
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.collectionView.registerCellNib(ImageCell.self)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    func setupActions() { }
    
    func applyStyles() { }
    
    // MARK: - DetailViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
    func updateSections(_ sections: [CollectionSectionModel]) {
            
        self.sections = sections
            
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.collectionView.reloadData()
        }
    }
}

// MARK: - Actions
extension DetailViewController { }

// MARK: - Module functions
extension DetailViewController { }

// MARK: - UICollectionViewDataSource
extension DetailViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let count = self.sections.count
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let cout = self.sections[section].rows.count
        return cout
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = self.sections[indexPath.section].rows[indexPath.row]
        
        if model is ImageCellModel {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.cellIdentifier, for: indexPath) as? ImageCell else { return UICollectionViewCell() }
            cell.model = model
            return cell
        }
        
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegate
extension DetailViewController: UICollectionViewDelegate { }
