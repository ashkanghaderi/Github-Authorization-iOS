//
//  UseCaseProvider.swift
//  NetworkPlatform
//
//  Created by Behrad Kazemi on 12/26/18.
//  Copyright © 2018 Behrad Kazemi. All rights reserved.
//
import Foundation
import Domain

public final class UseCaseProvider: Domain.UseCaseProvider {
    
    private let networkProvider: NetworkProvider

    public init() {
        networkProvider = NetworkProvider()
    }
    

      
    public func makeSearchRepositoryUseCase() -> Domain.SearchRepositoryUseCase {
        return SearchRepositoryUseCase(network: networkProvider.makeSearchRepositoryNetwork())
    }
    
    
}
