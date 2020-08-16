//
//  SubbreedsPresenter.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper
import GKRepresentable

protocol SubbreedsPresenterInput: ViperPresenterInput { }

class SubbreedsPresenter: ViperPresenter, SubbreedsPresenterInput, SubbreedsViewOutput {
    
    // MARK: - Props
    fileprivate var view: SubbreedsViewInput? {
        guard let view = self._view as? SubbreedsViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var router: SubbreedsRouterInput? {
        guard let router = self._router as? SubbreedsRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: SubbreedsViewModel
    
    // MARK: - Initialization
    init(breed: DogModel) {
        self.viewModel = SubbreedsViewModel(breed: breed)
    }
    
    // MARK: - SubbreedsPresenterInput
    func selectedCell(_ cellModel: TableCellIdentifiable) {
        if let cell = cellModel as? SubbreedCellModel {
            self.router?.pushToDetailOf(self.viewModel.breed.breed, cell.subbreed)
        }
    }
    
    // MARK: - SubbreedsViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
        self.makeSections()
    }
        
    // MARK: - Module functions
    func makeSections() {
        let mainSection = TableSectionModel()
        
        for subbreed in self.viewModel.breed.subbreed {
            let cellModel = SubbreedCellModel(subbreed: subbreed)
//            let cellModel = BreedCellModel(breed: DogModel(breed: "123", subbreed: ["1234", "4524635768i"]))
            mainSection.rows.append(cellModel)
        }
        
        if mainSection.rows.isEmpty {
            self.view?.updateSections([])
        } else {
            self.view?.updateSections([mainSection])
        }
    }
}
