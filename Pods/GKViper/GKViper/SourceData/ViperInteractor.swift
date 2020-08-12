//
//  ViperInteractor.swift
//
//  Created by  Кирилл on 21.08.2018.
//  Copyright © 2018 AppCraft. All rights reserved.
//

import GKExtensions

public protocol ViperInteractorInput: AnyObject {
    var _output: ViperInteractorOutput? { get set }
}

public protocol ViperInteractorOutput: AnyObject {
    func beginLoading()
    func finishLoading(with error: Error?)
    
    func provideMessage(_ title: String?, message: String?)
}

open class ViperInteractor: ViperInteractorInput {
    
    // MARK: - Props
    public weak var _output: ViperInteractorOutput?
    
    // MARK: - Initialization
    public init() { }

    // MARK: - ViperInteractorInputProtocol
    
    // MARK: - Module functions
    
}
