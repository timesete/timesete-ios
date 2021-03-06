//
//  ArticlesViewController.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 01/06/21.
//

import UIKit

class ArticlesViewController: UIViewController, ArticlesPresenterDelegate {

    let presenter = ArticlesPresenter()
    private var username = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setViewDelegate(delegate: self)
        self.view.setBackgroundColor(to: .appGray04)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        // Get logged username
        let coreDataManager = CoreDataManager.shared
        let users = coreDataManager.fetchUsers()

        guard let users = users else { return }
        for user in users where user.isLogged {
            self.username = user.name ?? "amigo"
        }

        if self.username.isEmpty {
            self.username = "amigo"
        }

        addSubviews()
        setupConstraints()
        articlesTableView.delegate = self
        articlesTableView.dataSource = self
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
    
    private(set) lazy var profileButton: UIButton = {
        let profileButton = UIButton()
        profileButton.imageView?.contentMode = .scaleAspectFit
        profileButton.setImage(UIImage(named: "profile-1"), for: .normal)
        profileButton.setTitle(.none, for: .normal)
        profileButton.addTarget(self, action: #selector(profileAction), for: .touchUpInside)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        return profileButton
    }()
    
    private(set) lazy var navLabel: UILabel = {
        let navLabel = UILabel()
        navLabel.text = "Ol??, \(username)!"
        navLabel.font = UIFont(name: .nunitoBlack, size: 18)
        navLabel.textColor = .white
        navLabel.translatesAutoresizingMaskIntoConstraints = false
        return navLabel
    }()
    
    // Main
    private(set) lazy var articlesTableView: UITableView = {
        let articlesTableView = UITableView(frame: CGRect(), style: .plain)
        articlesTableView.setBackgroundColor(to: .appGray04)
        articlesTableView.separatorStyle = .none
        articlesTableView.register(ArticlesTableViewCell.self, forCellReuseIdentifier: "articleCell")
        articlesTableView.translatesAutoresizingMaskIntoConstraints = false
        return articlesTableView
    }()
    
    private(set) lazy var articlesCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let articlesCollectionView = UICollectionView(frame: CGRect(), collectionViewLayout: flowLayout)
        articlesCollectionView.backgroundColor = .appGray04
        articlesCollectionView.register(ArticleFirstCollectionViewCell.self, forCellWithReuseIdentifier: "articleCell")
        articlesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return articlesCollectionView
    }()
    
    // MARK: Actions
    @objc func profileAction(sender: UIButton) {
        print("Perfil")
    }
}

extension ArticlesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let amountOfContent = contents else { return 1 }
        return 5 // amountOfContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = articlesTableView.dequeueReusableCell(
                withIdentifier: "articleCell",
                for: indexPath) as? ArticlesTableViewCell
        else { return UITableViewCell() }
        
        if indexPath.row == 0 {
            cell.articleImage.image = UIImage(named: "article-image-1")
            cell.articleTitle.text = "Meu amiguinho da escola ?? autista"
            cell.articleSubtitle.text = "Como ajudar sua crian??a a entender mais sobre autismo?"
        } else {
            cell.articleImage.image = UIImage(named: "article-image-2")
            cell.articleTitle.text = "O que ?? um hijab?"
            cell.articleSubtitle.text = "Ensinando a crian??a sobre culturas e religi??es diversas."
        }
        
        cell.learnMoreButton.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 355
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        guard let cell = tableView.cellForRow(at: indexPath) as? ContentsTableViewCell else { return }
        
    }
}
