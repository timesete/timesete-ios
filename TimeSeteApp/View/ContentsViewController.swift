//
//  ContentsViewController.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 01/06/21.
//

import UIKit

class ContentsViewController: UIViewController, ContentsPresenterDelegate {

    let presenter = ContentsPresenter()
    private var contents: [String]?
    private var contentsTitle: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.setViewDelegate(delegate: self)
        self.view.setBackgroundColor(to: .appGray04)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addSubviews()
        setupConstraints()
        contentsTableView.delegate = self
        contentsTableView.dataSource = self
    }
    
    init(contents: [String], contentsTitle: [String]) {
        super.init(nibName: nil, bundle: nil)
        self.contents = contents
        self.contentsTitle = contentsTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }
    
    // Header
    private(set) lazy var headerView: UIView = {
        let headerView = UIView()
        headerView.setBackgroundColor(to: .appPurple)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    private(set) lazy var backButton: UIButton = {
        let backButton = UIButton()
        backButton.imageView?.contentMode = .scaleAspectFit
        backButton.setImage(.backButton, for: .normal)
        backButton.setTitle(.none, for: .normal)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        return backButton
    }()
    
    // Main
    private(set) lazy var contentsTableView: UITableView = {
        let contentsTableView = UITableView(frame: CGRect(), style: .plain)
        contentsTableView.setBackgroundColor(to: .appGray04)
        contentsTableView.separatorStyle = .none
        contentsTableView.register(ContentsTableViewCell.self, forCellReuseIdentifier: "tableCell")
        contentsTableView.translatesAutoresizingMaskIntoConstraints = false
        return contentsTableView
    }()
    
    // MARK: Actions
    @objc func backAction(sender: UIButton) {
        presenter.backToScenery()
    }
}

extension ContentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let amountOfContent = contents else { return 1 }
        return amountOfContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = contentsTableView.dequeueReusableCell(
                withIdentifier: "tableCell",
                for: indexPath) as? ContentsTableViewCell
        else { return UITableViewCell() }
        
        guard let videoId = contents?[indexPath.row]
        else { return UITableViewCell() }
        
        guard let videoTitle = contentsTitle?[indexPath.row]
        else { return UITableViewCell() }
        
        cell.thumbView.load(withVideoId: videoId)
        cell.contentTitle.text = videoTitle
        cell.openOnYoutubeButton.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 412
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? ContentsTableViewCell else { return }
        
        cell.thumbView.playVideo()
    }
}
