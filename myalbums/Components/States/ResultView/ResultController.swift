//
//  ResultController.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 11.07.2023.
//

import UIKit

protocol ResultDisplayLayer: BaseDisplayLayer { }

final class ResultViewController: UIViewController {

    private var viewModel: ResultViewModelProtocol
    
    private let container: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        
        return stackView
    }()

    private let titleLabel: TLabel = {
        let label = TLabel()
        label.style = .largeTitle
    
        return label
    }()
    
    private let messageLabel: TLabel = {
        let label = TLabel()
        label.style = .smallTitle
        
        return label
    }()
        
    private let actionButton: TButton = .init()
    
    init(viewModel: ResultViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.view = self
        self.modalPresentationStyle = .overCurrentContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
}

private extension ResultViewController {
        
    func setupViews() {
        view.backgroundColor = .white
        
        titleLabel.text = viewModel.title
        messageLabel.text = viewModel.message
        actionButton.populate(with: viewModel.actionButtonViewModel())
        
        [container, actionButton].forEach(view.addSubview)
        [titleLabel, messageLabel].forEach(container.addArrangedSubview)
        
        container.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(BaseConstants.padding)
            make.centerY.equalToSuperview()
        }
        
        actionButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(BaseConstants.padding)
            make.bottom.equalTo(view.snp_bottomMargin).inset(BaseConstants.padding)
        }
    }
}

extension ResultViewController: ResultDisplayLayer { }
