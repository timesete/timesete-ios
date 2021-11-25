//
//  WorldViewController.swift
//  TimeSeteApp
//
//  Created by Mayara Ferreira de Oliveira on 31/05/21.
//

import UIKit

class WorldViewController: UIViewController, WorldPresenterDelegate {

    let presenter = WorldPresenter()
    private var username = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setViewDelegate(delegate: self)
        self.view.setBackgroundColor(to: .appGray04)
        self.navigationController?.isNavigationBarHidden = true

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
        print("\n\n\(self.username)\n\n")
        navLabel.text = "Olá, \(username)!" // "Olá, amigo!"
        navLabel.font = UIFont(name: .nunitoBlack, size: 18)
        navLabel.textColor = .white
        navLabel.translatesAutoresizingMaskIntoConstraints = false
        return navLabel
    }()
    
    private(set) lazy var messageView: UIView = {
        let messageView = UIView()
        messageView.setBackgroundColor(to: .appBlack40)
        messageView.translatesAutoresizingMaskIntoConstraints = false
        return messageView
    }()
    
    private(set) lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.text = "Clique nos seus amigos e descubra mais sobre eles"
        messageLabel.font = UIFont(name: .nunitoBlack, size: 16)
        messageLabel.numberOfLines = 0
        messageLabel.textColor = .white
        messageLabel.textAlignment = .center
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        return messageLabel
    }()
    
    private(set) lazy var sceneryImage: UIImageView = {
        let sceneryImage = UIImageView()
        sceneryImage.image = .scenery
        sceneryImage.contentMode = .scaleToFill
        sceneryImage.translatesAutoresizingMaskIntoConstraints = false
        return sceneryImage
    }()
    
    // Friends
    private(set) lazy var friend01Button: UIButton = {
        let friend01Button = UIButton()
        friend01Button.setImage(.friend01, for: .normal)
        friend01Button.imageView?.contentMode = .scaleAspectFit
        friend01Button.setTitle(.none, for: .normal)
        friend01Button.translatesAutoresizingMaskIntoConstraints = false
        friend01Button.addTarget(self, action: #selector(friend01Action), for: .touchUpInside)
        return friend01Button
    }()
    
    private(set) lazy var friend02Button: UIButton = {
        let friend02Button = UIButton()
        friend02Button.setImage(.friend02, for: .normal)
        friend02Button.imageView?.contentMode = .scaleAspectFit
        friend02Button.setTitle(.none, for: .normal)
        friend02Button.translatesAutoresizingMaskIntoConstraints = false
        friend02Button.addTarget(self, action: #selector(friend02Action), for: .touchUpInside)
        return friend02Button
    }()
    
    private(set) lazy var friend03Button: UIButton = {
        let friend03Button = UIButton()
        friend03Button.setImage(.friend03, for: .normal)
        friend03Button.imageView?.contentMode = .scaleAspectFit
        friend03Button.setTitle(.none, for: .normal)
        friend03Button.translatesAutoresizingMaskIntoConstraints = false
        friend03Button.addTarget(self, action: #selector(friend03Action), for: .touchUpInside)
        return friend03Button
    }()
    
    private(set) lazy var myFriendButton: UIButton = {
        let myFriendButton = UIButton()
        myFriendButton.setImage(.friend04, for: .normal)
        myFriendButton.imageView?.contentMode = .scaleAspectFit
        myFriendButton.setTitle(.none, for: .normal)
        myFriendButton.translatesAutoresizingMaskIntoConstraints = false
        myFriendButton.addTarget(self, action: #selector(myFriendAction), for: .touchUpInside)
        return myFriendButton
    }()
    
    // MARK: Actions
    @objc func profileAction(sender: UIButton) {
        print("Perfil")
    }
    
    @objc func friend01Action(sender: UIButton) {
        let contents = ["O9tp2lmWC-M", "zWhGS-AzSQ0", "_Y2eIi5HlDw"]
        let contentsTitle = ["BLACK BLACK- MÚSICA INFANTIL DE RESPEITO ÀS DIFERENÇAS E DIVERSIDADE - DIA DA CONSCIÊNCIA NEGRA",
            "O que é LGBTQIA+ para crianças!",
            "Turma da Mônica - Pessoas com deficiência"]
            
        videosURL.setVideosURL(videosURL: contents)
        presenter.goToContents(contents: contents, contentsTitle: contentsTitle)
    }
    
    @objc func friend02Action(sender: UIButton) {
        let contents = ["Entcc3mI0QI", "O79Xxl7RzkE"]
        let contentsTitle = ["Crianças desenham deus",
            "Eu vou para a escola de cadeira de rodas | Eu perdi as minhas pernas | História animada"]
        
        videosURL.setVideosURL(videosURL: contents)
        presenter.goToContents(contents: contents, contentsTitle: contentsTitle)
    }

    @objc func friend03Action(sender: UIButton) {
        let contents = ["O9tp2lmWC-M", "h4TKJ8AemB8"]
        let contentsTitle = ["BLACK BLACK- MÚSICA INFANTIL DE RESPEITO ÀS DIFERENÇAS E DIVERSIDADE - DIA DA CONSCIÊNCIA NEGRA",
            "Autismo - Coisas Fantásticas Acontecem"]
        
        videosURL.setVideosURL(videosURL: contents)
        presenter.goToContents(contents: contents, contentsTitle: contentsTitle)
    }
    
    @objc func myFriendAction(sender: UIButton) {
        let contents = ["h4TKJ8AemB8", "O79Xxl7RzkE"]
        let contentsTitle = ["Autismo - Coisas Fantásticas Acontecem",
            "Eu vou para a escola de cadeira de rodas | Eu perdi as minhas pernas | História animada"]
        
        videosURL.setVideosURL(videosURL: contents)
        presenter.goToContents(contents: contents, contentsTitle: contentsTitle)
    }
}
 
struct VideosURL {
    var videosURL: [String]?

    init(videosURL: [String]?) {
        self.videosURL = videosURL
    }
    
    func getVideosURL() -> [String]? {
        videosURL
    }
    
    mutating func setVideosURL(videosURL: [String]?) {
        self.videosURL = videosURL
    }
}

var videosURL = VideosURL(videosURL: [])
