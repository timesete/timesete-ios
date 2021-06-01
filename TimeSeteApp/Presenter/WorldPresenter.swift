//
//  WorldPresenter.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 31/05/21.
//

import UIKit

protocol WorldPresenterDelegate: AnyObject {

}

typealias WorldFriendPresenterDelegate = WorldPresenterDelegate & UIViewController

class WorldPresenter {
    
    weak var delegate: WorldFriendPresenterDelegate?
    
    public func setViewDelegate(delegate: WorldFriendPresenterDelegate) {
        self.delegate = delegate
    }
    
    public func getViewWidth() -> CGFloat? {
        self.delegate?.view.frame.size.width
    }
 
    public func getViewHeight() -> CGFloat? {
        self.delegate?.view.frame.size.height
    }
    
    public func goToContents(contents: [String], contentsTitle: [String]) {
        self.delegate?.navigationController?.pushViewController(
            ContentsViewController(contents: contents, contentsTitle: contentsTitle), animated: true)
    }
}
