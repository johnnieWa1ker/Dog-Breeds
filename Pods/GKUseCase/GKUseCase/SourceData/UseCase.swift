//
//  UseCase.swift
//
//  Created by  Кирилл on 4/12/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation

public protocol UseCaseInput: AnyObject {
    func subscribe(with output: UseCaseOutput)
}

public protocol UseCaseOutput: AnyObject { }

open class UseCase: UseCaseInput {
    
    // MARK: - Props
    public weak var _output: UseCaseOutput?
    
    // MARK: - Initialization
    public init() { }
    
    // MARK: - UseCaseInterface
    public func subscribe(with output: UseCaseOutput) {
        self._output = output
    }
    
}
