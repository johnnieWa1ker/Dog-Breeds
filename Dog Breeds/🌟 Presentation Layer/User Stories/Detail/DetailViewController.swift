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
//        self.collectionView.isPagingEnabled = true
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        
        let paginationLayout = PaginationLayout()
        self.collectionView.collectionViewLayout = paginationLayout
        paginationLayout.scrollDirection = .horizontal
    }
    
    func setupActions() { }
    
    func applyStyles() {
        self.view.apply(.asBackground())
        self.collectionView.apply(.standart())
    }
    
    // MARK: - DetailViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
                
        self.setupComponents()
        self.setupActions()
        
        guard let viewModel = viewModel as? DetailViewModel else { return }
        self.navigationItem.title = viewModel.breed.capitalized
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        var size = self.sections[indexPath.section].rows[indexPath.row].cellSize
//        size.width = self.view.bounds.width - 32
//        return size
        
        var cellSize: CGSize = collectionView.bounds.size
        
        cellSize.width -= collectionView.contentInset.left
        cellSize.width -= collectionView.contentInset.right
        cellSize.height = cellSize.width
        
        return cellSize
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//
//        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//
//        return 8
//    }
}

// MARK: - UICollectionViewDelegate
extension DetailViewController: UICollectionViewDelegate { }

// MARK: - UICollectionViewDelegateFlowLayout
extension DetailViewController: UICollectionViewDelegateFlowLayout {
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        let currentIndex: CGFloat = self.collectionView.contentOffset.x / self.collectionView.frame.size.width
//        pageControl.currentPage = Int(currentIndex)
//    }
}
