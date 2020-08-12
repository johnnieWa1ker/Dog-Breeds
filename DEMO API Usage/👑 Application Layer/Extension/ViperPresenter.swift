//
//  ViperPresenter.swift
//  DEMO API Usage
//
//  Created by Johnnie Walker on 12.08.2020.
//  Copyright © 2020 JW. All rights reserved.
//

import GKViper
import SwiftEntryKit

extension ViperPresenter {
    
    /// Shows a text notification without buttons in a pop-up window at the top of the screen (similar to standard notifications)
    /// 
    /// - Parameter message: Responsible for the message that will be in the interface
    /// - Parameter style: Responsible for the appearance of the interface. Allows you to separate UI according to the logical meaning of notifications
    /// - Parameter duration: Responsible for the time during which the notification will be displayed on the screen
    func showNotice(_ message: String, style: NoticeParam.Style, duration: NoticeParam.Duration) {
        DispatchQueue.main.async {
            
            var attributes = EKAttributes.topFloat
            attributes.hapticFeedbackType = .success
            attributes.entryBackground = .color(color: EKColor(AppTheme.orange))
            attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.3), scale: .init(from: 1, to: 0.7, duration: 0.7)))
            attributes.shadow = .active(with: .init(color: EKColor(AppTheme.black), opacity: 0.3, radius: 3))
            attributes.statusBar = .currentStatusBar
            attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .easeOut)
            attributes.positionConstraints.maxSize = .init(width: .constant(value: UIScreen.main.bounds.width), height: .intrinsic)
            attributes.displayDuration = duration == .long ? 8 : 4
            
            let titleText: String
            switch style {
            case .info:
                titleText = AppLocalization.General.info.loc
            case .error:
                titleText = AppLocalization.General.error.loc
            }
            let title = EKProperty.LabelContent(text: titleText,
                                                style: .init(font: SFPRO.medium.font(size: 16), color: EKColor(AppTheme.black)))
            
            let description = EKProperty.LabelContent(text: message, style: .init(font: SFPRO.medium.font(size: 14), color: EKColor(AppTheme.black)))
            
            let simpleMessage = EKSimpleMessage(image: nil, title: title, description: description)
            let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)
            
            let contentView = EKNotificationMessageView(with: notificationMessage)
            
            SwiftEntryKit.display(entry: contentView, using: attributes)
        }
    }
}
