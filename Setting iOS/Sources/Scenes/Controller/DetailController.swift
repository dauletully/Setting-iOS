//
//  DetailController.swift
//  Setting iOS
//
//  Created by Dinmukhammed Begaly on 25.11.2023.
//

import UIKit

class DetailController: UIViewController {
    
    public var setting: SettingOptions?
    private var detailView = DetailView()
    override func loadView() {
       super.loadView()
        view =  detailView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureNavigation()
    }
    private func setupUI() {
        detailView.configureTitle(text: setting?.title)
    }
    private func configureNavigation() {
            title = setting?.title
        }
}
