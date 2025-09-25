import UIKit

final class TabBarViewController: UITabBarController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabs()
        addTopBorderToTabBar()
    }
    
    // MARK: - Private methods
    
    private func setupTabs() {
        let trackersViewController = TrackersViewController()
        let navTrackersViewController = UINavigationController(rootViewController: trackersViewController)
        navTrackersViewController.navigationBar.prefersLargeTitles = true
        
        let statisticsViewController = StatisticsViewController()
        
        trackersViewController.tabBarItem = UITabBarItem(
            title: "Трекеры",
            image: R.image.trackers(),
            selectedImage: nil
        )
        
        statisticsViewController.tabBarItem = UITabBarItem(
            title: "Статистика",
            image: R.image.statistics(),
            selectedImage: nil
        )
        
        viewControllers = [navTrackersViewController, statisticsViewController]
    }
    
    private func addTopBorderToTabBar() {
            let border = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: tabBar.frame.width,
                                              height: 2))
        border.backgroundColor = R.color.ypGray()
            tabBar.addSubview(border)
        }
}
