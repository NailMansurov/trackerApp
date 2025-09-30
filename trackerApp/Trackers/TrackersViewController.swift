import UIKit

final class TrackersViewController: UIViewController {
    
    // MARK: - Constants
    
    private enum Constants {
        static let navigationItemTitle: String = "Трекеры"
        static let navigationBarFontSize: CGFloat = 34
        
        static let dateLabelFontSize: CGFloat = 17
        static let dateLabelCornerRadius: CGFloat = 8
        static let dateLabelHeight: CGFloat = 34
        static let dateLabelWidth: CGFloat = 77
        
        static let searchControllerText: String = "Поиск"
        
        static let errorText = "Что будем отслеживать?"
        static let erroorLabelFontSize: CGFloat = 12
        static let errorLabelTop: CGFloat = 8
        static let errorLabelLeading: CGFloat = 16
        static let errorLabelTrailing: CGFloat = -16
        static let errorLabelHeight: CGFloat = 18
    }
    
    // MARK: - Private properties
    
    private lazy var errorLogo: UIImageView = {
        let imageView = UIImageView(image: R.image.errorLogo())
        view.addSubview(imageView)
        return imageView
    }()
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.color.ypBlack()
        label.text = Constants.errorText
        label.font = UIFont.systemFont(ofSize: Constants.erroorLabelFontSize, weight: .medium)
        label.textAlignment = .center
        view.addSubview(label)
        return label
    }()
    
    private var categories: [TrackerCategory] = []
    private var completedTrackers: [TrackerRecord] = []
    private var newCategories: [TrackerCategory] = []
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupSearchController()
        
        setupUI()
        setupConstraints()
    }
    
    // MARK: - Private methods
    
    private func setupNavigationBar() {
        navigationItem.title = Constants.navigationItemTitle
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .font: UIFont.systemFont(ofSize: Constants.navigationBarFontSize, weight: .bold),
            .foregroundColor: R.color.ypBlack() ?? UIColor.black
        ]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: R.image.addButton(),
            style: .plain,
            target: self,
            action: #selector(didTapAdd)
        )
        navigationItem.leftBarButtonItem?.tintColor = R.color.ypBlack()
        
        let dateLabel = UILabel()
        dateLabel.text = "14.12.22"
        dateLabel.font = UIFont.systemFont(ofSize: Constants.dateLabelFontSize, weight: .regular)
        dateLabel.textColor = R.color.ypBlack()
        dateLabel.backgroundColor = R.color.ypGray()
        dateLabel.textAlignment = .center
        dateLabel.layer.cornerRadius = Constants.dateLabelCornerRadius
        dateLabel.layer.masksToBounds = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.heightAnchor.constraint(equalToConstant: Constants.dateLabelHeight),
            dateLabel.widthAnchor.constraint(equalToConstant: Constants.dateLabelWidth)
        ])
    }
    
    private func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = Constants.searchControllerText
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    @objc
    private func didTapAdd() {
        
    }
    
    private func setupUI() {
        view.addSubviews(
            errorLogo,
            errorLabel
        )
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            errorLogo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            errorLogo.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            errorLabel.topAnchor.constraint(equalTo: errorLogo.bottomAnchor, constant: Constants.errorLabelTop),
            errorLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.errorLabelLeading),
            errorLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Constants.errorLabelTrailing),
            errorLabel.heightAnchor.constraint(equalToConstant: Constants.errorLabelHeight)
        ])
    }
}

// MARK: - Extensions

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
}
