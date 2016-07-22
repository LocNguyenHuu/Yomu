//
//  ChapterPageViewModel.swift
//  Yomu
//
//  Created by Sendy Halim on 7/20/16.
//  Copyright © 2016 Sendy Halim. All rights reserved.
//

import RxCocoa
import RxSwift

struct ChapterPageViewModel {
  private let chapterPage: Variable<ChapterPage>

  var imageUrl: Driver<NSURL> {
    return chapterPage.asDriver().map { $0.image.url }
  }

  let scale: Driver<CGFloat>

  init(page: ChapterPage, scale: Driver<CGFloat>) {
    chapterPage = Variable(page)
    self.scale = scale
  }
}