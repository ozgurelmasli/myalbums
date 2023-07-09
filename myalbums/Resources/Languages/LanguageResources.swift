//
//  LanguageResources.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

final class LanguageResources {
    
    /// Supported App Languages
    enum SupportLanguages: String {
        case english = "en"
    }
    
    /// Current app language
    static var preferredLanguage: SupportLanguages = .english
    
    /// Localized String Resources
    static func strings() -> _R.string.localizable {
        return R.string.localizable(preferredLanguages: [preferredLanguage.rawValue])
    }
}
