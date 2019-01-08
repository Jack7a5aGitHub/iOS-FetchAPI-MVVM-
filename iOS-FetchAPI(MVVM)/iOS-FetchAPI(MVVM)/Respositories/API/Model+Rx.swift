//
//  Model+Rx.swift
//  iOS-FetchAPI(MVVM)
//
//  Created by Jack Wong on 2019/01/07.
//  Copyright © 2019 Jack Wong. All rights reserved.
//

import Foundation
import RxSwift

extension ObservableType where E == Data {
    public func mapModel<T: Decodable>(model: T.Type) -> Observable<T> {
        return flatMap { data -> Observable<T> in
            let decoder = JSONDecoder()
            let decoded = try decoder.decode(model, from: data)
            return .just(decoded)
        }
    }
}
