//
//  HomeNavigationStackView.swift
//  DreamMeeting
//
//  Created by Станислав Лемешаев on 25.01.2021.
//

import UIKit

class HomeNavigationStackView: UIStackView {
    
    // MARK: - Properties
    
    let settingsButton = UIButton(type: .system)
    let messageButton = UIButton(type: .system)
    let dreamMeetingIcon = UIImageView(image: #imageLiteral(resourceName: "app_icon"))
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let topNavigationBar = [settingsButton, UIView(),
                                dreamMeetingIcon, UIView(),
                                messageButton]
        
        topNavigationBar.forEach { view in
            addArrangedSubview(view)
        }
        
        distribution = .equalCentering
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
