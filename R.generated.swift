//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import RswiftResources
import UIKit

private class BundleFinder {}
let R = _R(bundle: Bundle(for: BundleFinder.self))

struct _R {
  let bundle: Foundation.Bundle
  var string: string { .init(bundle: bundle, preferredLanguages: nil, locale: nil) }
  var color: color { .init(bundle: bundle) }
  var image: image { .init(bundle: bundle) }
  var info: info { .init(bundle: bundle) }
  var storyboard: storyboard { .init(bundle: bundle) }

  func string(bundle: Foundation.Bundle) -> string {
    .init(bundle: bundle, preferredLanguages: nil, locale: nil)
  }
  func string(locale: Foundation.Locale) -> string {
    .init(bundle: bundle, preferredLanguages: nil, locale: locale)
  }
  func string(preferredLanguages: [String], locale: Locale? = nil) -> string {
    .init(bundle: bundle, preferredLanguages: preferredLanguages, locale: locale)
  }
  func color(bundle: Foundation.Bundle) -> color {
    .init(bundle: bundle)
  }
  func image(bundle: Foundation.Bundle) -> image {
    .init(bundle: bundle)
  }
  func info(bundle: Foundation.Bundle) -> info {
    .init(bundle: bundle)
  }
  func storyboard(bundle: Foundation.Bundle) -> storyboard {
    .init(bundle: bundle)
  }
  func validate() throws {
    try self.storyboard.validate()
  }

  struct project {
    let developmentRegion = "en"
  }

  /// This `_R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    let bundle: Foundation.Bundle
    let preferredLanguages: [String]?
    let locale: Locale?
    var localizable: localizable { .init(source: .init(bundle: bundle, tableName: "Localizable", preferredLanguages: preferredLanguages, locale: locale)) }

    func localizable(preferredLanguages: [String]) -> localizable {
      .init(source: .init(bundle: bundle, tableName: "Localizable", preferredLanguages: preferredLanguages, locale: locale))
    }


    /// This `_R.string.localizable` struct is generated, and contains static references to 7 localization keys.
    struct localizable {
      let source: RswiftResources.StringResource.Source

      /// en translation: My albums
      ///
      /// Key: album_list_title
      ///
      /// Locales: en
      var album_list_title: RswiftResources.StringResource { .init(key: "album_list_title", tableName: "Localizable", source: source, developmentValue: "My albums", comment: nil) }

      /// en translation: Close
      ///
      /// Key: core_close_button_title
      ///
      /// Locales: en
      var core_close_button_title: RswiftResources.StringResource { .init(key: "core_close_button_title", tableName: "Localizable", source: source, developmentValue: "Close", comment: nil) }

      /// en translation: JSON could't parsed correctly
      ///
      /// Key: core_decode_error_message
      ///
      /// Locales: en
      var core_decode_error_message: RswiftResources.StringResource { .init(key: "core_decode_error_message", tableName: "Localizable", source: source, developmentValue: "JSON could't parsed correctly", comment: nil) }

      /// en translation: Error Occurred.
      ///
      /// Key: core_default_error_title
      ///
      /// Locales: en
      var core_default_error_title: RswiftResources.StringResource { .init(key: "core_default_error_title", tableName: "Localizable", source: source, developmentValue: "Error Occurred.", comment: nil) }

      /// en translation: Loading...
      ///
      /// Key: core_loading_title
      ///
      /// Locales: en
      var core_loading_title: RswiftResources.StringResource { .init(key: "core_loading_title", tableName: "Localizable", source: source, developmentValue: "Loading...", comment: nil) }

      /// en translation: Close
      ///
      /// Key: core_result_default_button_title
      ///
      /// Locales: en
      var core_result_default_button_title: RswiftResources.StringResource { .init(key: "core_result_default_button_title", tableName: "Localizable", source: source, developmentValue: "Close", comment: nil) }

      /// en translation: Something went wrong.
      ///
      /// Key: core_something_went_wrong_error_message
      ///
      /// Locales: en
      var core_something_went_wrong_error_message: RswiftResources.StringResource { .init(key: "core_something_went_wrong_error_message", tableName: "Localizable", source: source, developmentValue: "Something went wrong.", comment: nil) }
    }
  }

  /// This `_R.color` struct is generated, and contains static references to 3 colors.
  struct color {
    let bundle: Foundation.Bundle

    /// Color `AccentColor`.
    var accentColor: RswiftResources.ColorResource { .init(name: "AccentColor", path: [], bundle: bundle) }

    /// Color `darkGreenColor`.
    var darkGreenColor: RswiftResources.ColorResource { .init(name: "darkGreenColor", path: [], bundle: bundle) }

    /// Color `darkRedColor`.
    var darkRedColor: RswiftResources.ColorResource { .init(name: "darkRedColor", path: [], bundle: bundle) }
  }

  /// This `_R.image` struct is generated, and contains static references to 2 images.
  struct image {
    let bundle: Foundation.Bundle

    /// Image `ic_active_filter`.
    var ic_active_filter: RswiftResources.ImageResource { .init(name: "ic_active_filter", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }

    /// Image `ic_unactive_filter`.
    var ic_unactive_filter: RswiftResources.ImageResource { .init(name: "ic_unactive_filter", path: [], bundle: bundle, locale: nil, onDemandResourceTags: nil) }
  }

  /// This `_R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    let bundle: Foundation.Bundle
    var uiApplicationSceneManifest: uiApplicationSceneManifest { .init(bundle: bundle) }

    func uiApplicationSceneManifest(bundle: Foundation.Bundle) -> uiApplicationSceneManifest {
      .init(bundle: bundle)
    }

    struct uiApplicationSceneManifest {
      let bundle: Foundation.Bundle

      let uiApplicationSupportsMultipleScenes: Bool = false

      var _key: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest"], key: "_key") ?? "UIApplicationSceneManifest" }
      var uiSceneConfigurations: uiSceneConfigurations { .init(bundle: bundle) }

      func uiSceneConfigurations(bundle: Foundation.Bundle) -> uiSceneConfigurations {
        .init(bundle: bundle)
      }

      struct uiSceneConfigurations {
        let bundle: Foundation.Bundle
        var _key: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations"], key: "_key") ?? "UISceneConfigurations" }
        var uiWindowSceneSessionRoleApplication: uiWindowSceneSessionRoleApplication { .init(bundle: bundle) }

        func uiWindowSceneSessionRoleApplication(bundle: Foundation.Bundle) -> uiWindowSceneSessionRoleApplication {
          .init(bundle: bundle)
        }

        struct uiWindowSceneSessionRoleApplication {
          let bundle: Foundation.Bundle
          var defaultConfiguration: defaultConfiguration { .init(bundle: bundle) }

          func defaultConfiguration(bundle: Foundation.Bundle) -> defaultConfiguration {
            .init(bundle: bundle)
          }

          struct defaultConfiguration {
            let bundle: Foundation.Bundle
            var uiSceneConfigurationName: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneConfigurationName") ?? "Default Configuration" }
            var uiSceneDelegateClassName: String { bundle.infoDictionaryString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate" }
          }
        }
      }
    }
  }

  /// This `_R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    let bundle: Foundation.Bundle
    var launchScreen: launchScreen { .init(bundle: bundle) }

    func launchScreen(bundle: Foundation.Bundle) -> launchScreen {
      .init(bundle: bundle)
    }
    func validate() throws {
      try self.launchScreen.validate()
    }


    /// Storyboard `LaunchScreen`.
    struct launchScreen: RswiftResources.StoryboardReference, RswiftResources.InitialControllerContainer {
      typealias InitialController = UIKit.UIViewController

      let bundle: Foundation.Bundle

      let name = "LaunchScreen"
      func validate() throws {

      }
    }
  }
}