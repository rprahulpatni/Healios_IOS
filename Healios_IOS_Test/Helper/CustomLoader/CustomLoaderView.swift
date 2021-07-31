//
//  CustomLoaderView.swift
//  Intellergy
//
//  Created by Neosoft on 29/06/21.
//

import UIKit

class CustomLoaderView: UIView {
    
    static var shared = CustomLoaderView.loadView()
        
    @IBOutlet weak var activityIndicator : UIActivityIndicatorView!
    private static let nibName = "CustomLoaderView"
    
    static func loadView() -> CustomLoaderView? {
        guard let view = Bundle.main
                .loadNibNamed(nibName, owner: self, options: nil)?[0]
                as? CustomLoaderView else {
            return nil
        }
        view.backgroundColor = .black.withAlphaComponent(0.5)
        return view
        
    }
    
    static func showLoader() {
        CustomLoaderView.shared?.showProgress()
    }
    
    static func dismiss() {
        CustomLoaderView.shared?.hideProgress()
    }
    
    private func showProgress() {
        activityIndicator.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        activityIndicator.startAnimating()
        sceneDelegate.window?.addSubview(self)
        self.frame = UIScreen.main.bounds
    }
    
    private func hideProgress () {
        self.activityIndicator.stopAnimating()
        self.removeFromSuperview()
    }
}
