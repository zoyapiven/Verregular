//
//  SelectVerbTableViewCell.swift
//  Verregular
//
//  Created by Miroslav Deryuga on 22.04.2023.
//

import UIKit
import SnapKit


final class SelectVerbTableViewCell: UITableViewCell {
    
    enum State {
        case select, unselect
        
        var image: UIImage {
            switch self {
            case .select:
                return UIImage.checkmark
            case .unselect:
                return UIImage(systemName: "circlebadge") ?? UIImage.add
            }
        }
    }
    // MARK: - GUI Variables // create elements to add to screen
    private lazy var checkboxImageView: UIImageView = {
        let view = UIImageView()
        
        view.image = State.unselect.image
        view.contentMode = .center
        
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        
        view.axis = .horizontal // стэк гор. или верт.
        view.distribution = .fillEqually // как выравниваются эл. в стэке
        view.alignment = .center // вертик выравнивание констрейнта
        view.spacing = 5 // расст между элементами стэка
        
        return view
    }()
    
    private lazy var infinitiveView: UIView = UIView()
    
    private lazy var infinitiveLabel: UILabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 16)
        
        
        
        return label
    }()
    
    private lazy var translationLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 12)
        label.textColor = .blue
        
        
        
        return label
    }()
    
    private lazy var pastLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var participleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        
        return label
    }()
    
    // MARK: - Initialisation
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    // чтобы засетапать значения глаголов
    func configure(with verb: Verb, isSelected: Bool) {
        infinitiveLabel.text = verb.infinitive
        translationLabel.text = verb.translation
        pastLabel.text = verb.pastSimple
        participleLabel.text = verb.participle
        checkboxImageView.image = isSelected ? State.select.image : State.unselect.image
    }
    
    
    // MARK: - Private Methods
    private func setupUI() {

        selectionStyle = .none
        infinitiveView.addSubViews(views: [infinitiveLabel, translationLabel])
        stackView.addArrangedSubviews(views: [infinitiveView, pastLabel, participleLabel])
        addSubViews(views: [checkboxImageView, stackView])
        
        checkboxImageView.image = isSelected ? State.select.image : State.unselect.image // какая картинка в чб имаджВью
        setupConstraints()
    }
        // добавить все элементы в stackView
    private func setupConstraints() {
        checkboxImageView.snp.makeConstraints{ make in
            make.width.height.equalTo(20)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
        }
        infinitiveLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.equalToSuperview()
            make.top.equalTo(infinitiveLabel.snp.bottom).offset(0)
        }
        
        translationLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        infinitiveLabel.snp.makeConstraints { make in
            make.height.equalTo(69)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(checkboxImageView.snp.trailing).offset(5)
            make.top.right.bottom.equalToSuperview()
        }
    }
    
}

