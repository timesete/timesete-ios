//
//  ContentsViewController.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 01/06/21.
//

import UIKit
import AVKit

class ContentsViewController: UIViewController, ContentsPresenterDelegate {

    let presenter = ContentsPresenter()
    private var amountOfContent = 5
    
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

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }
    
    func playVideo(url: URL) {
            let player = AVPlayer(url: url)
            
            let vc = AVPlayerViewController()
            vc.player = player
            
            self.present(vc, animated: true) { vc.player?.play() }
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
        return self.amountOfContent
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = contentsTableView.dequeueReusableCell(
                withIdentifier: "tableCell",
                for: indexPath) as? ContentsTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 412
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let url = URL(string: "https://www.youtube.com/watch?v=6W2vuwWTAU4") ?? nil
        playVideo(url: url!)
    }
}
