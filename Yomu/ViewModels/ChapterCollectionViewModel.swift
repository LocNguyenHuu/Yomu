//
//  MangaViewModel.swift
//  Yomu
//
//  Created by Sendy Halim on 6/15/16.
//  Copyright © 2016 Sendy Halim. All rights reserved.
//

import RxMoya
import RxSwift
import RxCocoa
import Swiftz

struct ChapterCollectionViewModel {
  private let _chapters = Variable(List<ChapterViewModel>())
  private let provider = RxMoyaProvider<MangaEdenAPI>()

  var chapters: Driver<List<ChapterViewModel>> {
    return _chapters.asDriver()
  }

  var count: Int {
    return _chapters.value.count
  }

  func fetch(id: String) -> Disposable {
    let api = MangaEdenAPI.MangaDetail(id)

    return provider
      .request(api)
      .filterSuccessfulStatusCodes()
      .mapArray(Chapter.self, withRootKey: "chapters")
      .map {
        $0.map(ChapterViewModel.init)
      }
      .subscribeNext {
        self._chapters.value = List<ChapterViewModel>(fromArray: $0)
      }
  }

  subscript(index: Int) -> ChapterViewModel {
    return _chapters.value[UInt(index)]
  }
}
