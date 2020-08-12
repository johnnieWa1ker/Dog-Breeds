//
//  InitialRouter.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper

protocol InitialRouterInput: ViperRouterInput {
    func presentBreeds()
}

class InitialRouter: ViperRouter, InitialRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: InitialViewController? {
        guard let mainController = self._mainController as? InitialViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - InitialRouterInput
    func presentBreeds() {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            
            let breedsVC = BreedsAssembly.create()
            _ = BreedsAssembly.configure(with: breedsVC)
            
            let favoriteVC = FavoriteAssembly.create()
            _ = FavoriteAssembly.configure(with: favoriteVC)
            
            let breedsNC = BasicNavigationController(rootViewController: breedsVC)
            
            //            let breedsBarItemImage = AppAssets.iconListBullets
            //            breedsBarItemImage.siz
            
            let breedsBarItem = UITabBarItem(title: AppLocalization.Breeds.tabTitle.loc,
                                             image: AppAssets.iconListBullets,
                                             selectedImage: nil)
            
            let favoriteBarItem = UITabBarItem(title: AppLocalization.Favorite.tabTitle.loc,
                                               image: AppAssets.iconStar,
                                               selectedImage: nil)
            
            breedsVC.tabBarItem = breedsBarItem
            favoriteVC.tabBarItem = favoriteBarItem
            
            let tabBarController = UITabBarController()
            tabBarController.setViewControllers([breedsNC, favoriteVC], animated: false)
            tabBarController.modalPresentationStyle = .fullScreen
            tabBarController.tabBar.isTranslucent = true
            tabBarController.tabBar.tintColor = AppTheme.mainAccent
            tabBarController.tabBar.barTintColor = AppTheme.mainBackground
            tabBarController.tabBar.backgroundColor = AppTheme.mainBackground
            
            strongSelf.present(tabBarController, animated: true)
        }
    }
    
    // MARK: - Module functions
}
