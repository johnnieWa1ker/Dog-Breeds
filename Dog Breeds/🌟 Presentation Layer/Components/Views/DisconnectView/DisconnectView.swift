//
//  File.swift
//  Dog Breeds
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import UIKit
import GKViper

protocol DisconnectViewDelegate: AnyObject {
      func reload()
  }

class DisconnectView: UIView {

    // MARK: - Outlets
    @IBOutlet private weak var view: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var reloadButton: UIButton!
    
    // MARK: - Props
    let refreshControl = UIRefreshControl()
    weak var delegate: DisconnectViewDelegate?
    
    // MARK: Inicialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    //swiftlint:disable force_unwrapping
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.initialize()
    }
    // swiftlint:enable force_unwrapping
    
    func initialize() {
        self.setupComponents()
        self.setupActions()
        self.applyStyle()
    }
    
    // MARK: - Setup functions
    private func setupComponents() {
        Bundle.main.loadNibNamed("DisconnectView", owner: self, options: nil)
        self.addSubview(self.view)
        self.view.frame = self.bounds
        self.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.view.backgroundColor = AppTheme.white
        self.scrollView.refreshControl = self.refreshControl
        self.titleLabel.text = AppLocalization.Disconnect.title.loc
        self.titleLabel.numberOfLines = 0
        self.imageView.image = AppAssets.iconDisconnect
    }
    
    private func setupActions() {
        self.refreshControl.addTarget(self, action: #selector(reloadButtonAction), for: .valueChanged)
    }

    private func applyStyle() {
        self.titleLabel.apply(.sfTitle2Bold24(AppTheme.black, .center))
        self.reloadButton.apply(.accent())
    }
    
    // MARK: - Actions
    @objc
    func reloadButtonAction() {
        self.refreshControl.endRefreshing()
        self.delegate?.reload()
    }
}
