//
//  DetailPresenter.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol DetailPresenterInput: ViperPresenterInput { }

class DetailPresenter: ViperPresenter, DetailPresenterInput, DetailViewOutput {
    
    // MARK: - Props
    fileprivate var view: DetailViewInput? {
        guard let view = self._view as? DetailViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var router: DetailRouterInput? {
        guard let router = self._router as? DetailRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: DetailViewModel
    let dogUseCase: DogUseCaseInput
    
    // MARK: - Initialization
    init(breed: String, subbreed: String?) {
        self.viewModel = DetailViewModel(breed: breed, subbreed: subbreed)
        self.dogUseCase = DogUseCase()
        super.init()
        self.dogUseCase.subscribe(with: self)
    }
    
    // MARK: - DetailPresenterInput
    
    // MARK: - DetailViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
        self.dogUseCase.getImageOfBreed(self.viewModel.breed)
        
        if viewModel.subbreed != nil {
            self.dogUseCase.getImageOfBreed(self.viewModel.breed)
        } else if let subbreed = self.viewModel.subbreed {
            self.dogUseCase.getImageOfSubbreed(self.viewModel.breed, subbreed)
        }
    }
        
    // MARK: - Module functions
    func makeSections() {
        let mainSection = CollectionSectionModel()
        
        for imageModel in self.viewModel.images {
            let cellModel = ImageCellModel(image: imageModel)
            cellModel.like = { image in
                
            }
            cellModel.share = { url in
                
            }
            mainSection.rows.append(cellModel)
        }
        
        if mainSection.rows.isEmpty {
            self.view?.updateSections([])
        } else {
            self.view?.updateSections([mainSection])
        }
    }
}

// MARK: - DogUseCaseOutput
extension DetailPresenter: DogUseCaseOutput {
    
    func provideImage(_ result: [ImageModel]) {
        self.viewModel.images = result
        self.makeSections()
    }

    func noInternetConnection() {
        self.view?.finishLoading(with: nil)
        self.showNotice(AppLocalization.ErrorMessage.noInternetConnection.loc, style: .error, duration: .short)
    }
}
