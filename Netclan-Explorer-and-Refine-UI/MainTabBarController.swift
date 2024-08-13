//
//  MainTabBarController.swift
//  Netclan-Explorer-and-Refine-UI
//
//  Created by Suraphel on 7/13/23.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeViews()
        addViewControllers()
    }

}

extension MainTabBarController {
    
    private func customizeViews() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = UIColor.accentColor
        tabBar.tintColor = UIColor.accentColor
        tabBar.unselectedItemTintColor = UIColor.gray
        tabBar.isTranslucent = false
        tabBar.barTintColor = .white
        addCustomTabBar()
    }
    
    private func addCustomTabBar() {
        let customTabBar = UIView()
        customTabBar.backgroundColor = .white
        customTabBar.translatesAutoresizingMaskIntoConstraints = false
        customTabBar.layer.cornerRadius = 30
        customTabBar.layer.shadowColor = UIColor.accentColor?.cgColor
        customTabBar.layer.shadowOpacity = 0.9
        customTabBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        customTabBar.layer.shadowRadius = 4
        
        tabBar.addSubview(customTabBar)
        NSLayoutConstraint.activate([
            customTabBar.topAnchor.constraint(equalTo: tabBar.safeAreaLayoutGuide.topAnchor),
            customTabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
            customTabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
            customTabBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor)
        ])
    }
    
    private func addViewControllers() {
        let exploreVc = UINavigationController(rootViewController: ExploreViewController())
        exploreVc.title = "Explore"
        exploreVc.tabBarItem.image = UIImage(systemName: "eye")
        exploreVc.tabBarItem.selectedImage = UIImage(named: "eye.fill")
        
        let networkVc = createViewController(withName: "Network", images: ["network","network" ])
        let chatVc = createViewController(withName: "Chat", images: ["ellipsis.message","ellipsis.message.fill" ])
        let contactsVc = createViewController(withName: "Contacts", images: ["person.crop.circle","person.crop.circle.fill" ])
        let groupsVc = createViewController(withName: "Groups", images: ["number","number.circle.fill" ])
        
        setViewControllers([exploreVc, networkVc, chatVc, contactsVc, groupsVc], animated: true)
    }
    
    //MARK: - Helper Function
    private func createViewController(withName name: String, images: [String]) -> UIViewController {
        let viewController = UINavigationController(rootViewController: TestViewController())
        viewController.title = name
        viewController.tabBarItem.image = UIImage(systemName: images[0])
        viewController.tabBarItem.selectedImage = UIImage(systemName: images[1])
        return viewController
    }

}

//MARK: - Used For Live Preview
import SwiftUI

struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            MainTabBarController()
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ViewControllerPreview: UIViewControllerRepresentable {
    let viewControllerBuilder: () -> UIViewController
    
    init(_ viewControllerBuilder: @escaping () -> UIViewController) {
        self.viewControllerBuilder = viewControllerBuilder
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return viewControllerBuilder()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // Not needed
    }
}
