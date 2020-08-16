//
//  BreedsPresenter.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper
import GKRepresentable

protocol BreedsPresenterInput: ViperPresenterInput { }

class BreedsPresenter: ViperPresenter, BreedsPresenterInput, ListViewOutput {
    
    // MARK: - Props
    fileprivate var view: ListViewInput? {
        guard let view = self._view as? ListViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var router: BreedsRouterInput? {
        guard let router = self._router as? BreedsRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: BreedsViewModel
    let dogUseCase: DogUseCaseInput?
    
    // MARK: - Initialization
    override init() {
        self.viewModel = BreedsViewModel()
        self.dogUseCase = DogUseCase()
        super.init()
        self.dogUseCase?.subscribe(with: self)
    }
    
    // MARK: - BreedsPresenterInput
    func selectedCell(_ cellModel: TableCellIdentifiable) {
        if let cell = cellModel as? BreedCellModel {
            if cell.breedModel.subbreed.isEmpty {
                self.router?.pushToDetailOf(cell.breedModel.breed)
            } else {
                self.router?.pushToSubbreedOf(cell.breedModel)
            }
        }
    }
    
    // MARK: - ListViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
        
        self.dogUseCase?.getBreeds()
    }
    
    // MARK: - Module functions
    func makeSections() {
        let mainSection = TableSectionModel()
        
        guard let breeds = self.viewModel.breeds else { return }
        for breed in breeds {
            let cellModel = BreedCellModel(breed: breed)
            mainSection.rows.append(cellModel)
        }
        
        mainSection.rows.sort { (firstModel, secondModel) -> Bool in
            let firstCellModel = firstModel as? BreedCellModel
            let secondCellModel = secondModel as? BreedCellModel
            guard let firstCellBreed = firstCellModel?.breedModel.breed else { return false }
            guard let secondCellBreed = secondCellModel?.breedModel.breed else { return false }
            
            return firstCellBreed < secondCellBreed ? true : false
        }
        
        if mainSection.rows.isEmpty {
            self.view?.updateSections([])
        } else {
            self.view?.updateSections([mainSection])
        }
    }
}

// MARK: - DogUseCaseOutput
extension BreedsPresenter: DogUseCaseOutput {
    
    func provideBreeds(_ result: [DogModel]) {
        self.viewModel.breeds = result
        self.makeSections()
    }
    
    func noInternetConnection() {
        self.view?.finishLoading(with: nil)
        self.showNotice(AppLocalization.ErrorMessage.noInternetConnection.loc, style: .error, duration: .short)
    }
}
