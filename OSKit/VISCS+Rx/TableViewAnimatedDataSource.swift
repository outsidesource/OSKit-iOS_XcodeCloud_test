//
//  TableViewAnimatedDataSource.swift
//  OSKit
//
//  Created by Brody Robertson.
//  Copyright © 2020 Outside Source. All rights reserved.
//

import RxDataSources

public typealias TableViewAnimatableSectionModel = AnimatableSectionModel<SectionViewState<ViewState, TableViewCellState>, TableViewCellState>
public typealias TableViewAnimatedDataSource = RxTableViewSectionedAnimatedDataSource<TableViewAnimatableSectionModel>
