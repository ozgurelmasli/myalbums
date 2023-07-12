# Tandem Case Study (MyAlbums)

---

This is a small iOS application that allows users to view a list of photo albums and browse through the photos contained within each album. The application is built using **Swift** and follows the MVVM pattern.

### Tech Stack

- **Swift, UIKit**
- Networking layer written with **URLSession, Async/Await**
    - It eliminates the need for callbacks or completion handlers, resulting in cleaner and more readable code
    - Improves error handling by making it easier to propagate and handle errors in asynchronous operations. It allows for the use of try-catch blocks, making it straightforward to catch and handle exceptions within the asynchronous code flow.
    - More intuitive and structured way to handle parallel execution, It allows multiple asynchronous operations to run concurrently.
- Design Pattern: **MVVM**
    - Easy to maintain
    - Easy to create own unit test flows
    - Every type of class has own logic and own functions
    - ViewModel can be tested independently of the view
    - Promotes reusability, as the ViewModel can be shared across different controllers

### Features

- Users can view a list of photo albums retrieved from the **[JSONPlaceholder API](https://jsonplaceholder.typicode.com/albums)**.
- Users can filter photo albums of selected user Id
- Users can select an album to see the photos contained within it. The photos are fetched from the **[JSONPlaceholder API](https://jsonplaceholder.typicode.com/photos)** based on the album's ID. ( with random cover image )
- User can select some specific photo to see the full size photo. The photo is fetched from resource `url` of photo.

### **Prerequisites**

- Xcode (latest stable version)
- Swift (latest stable version)

### Setup

- Download or Clone application
- Open terminal and run `pod install`
- Open  **`myalbums.xcworkspace`**
- Run app with some specified simulator or real device.

### Third Party

Dependency Manager: CocoaPods 

- **R.swift**

R.swift is a code generator tool that generates type-safe resources for your project. It helps in eliminating the usage of string literals when referring to resources such as images, and localized strings. App has basic layer for reaching resources easily. ex. `AssetResources`, `LanguageResources`

- **SnapKit**

SnapKit is a popular Swift library used for programmatic Auto Layout. It simplifies the process of creating and managing constraints by providing a more expressive and readable syntax

- **Kingfisher**

Kingfisher is a powerful Swift library for **downloading** and caching **images** from the web. It provides a convenient API for loading images asynchronously, handling caching, and displaying images with placeholder. ex.`AssetResources.configure()`

- **Moya**

Moya is a network abstraction layer built on top of Alamofire. It simplifies the process of making network requests by encapsulating the request and response handling logic in a clean and testable manner. ex. `NetworkTargetType`

### Project Structure

`Base` directory: Includes base classes and layers.

`App` directory: App configuration and app lifecycle classes

`Modules` directory: Includes different modules controller and viewModels classes

`Resources` directory: Includes assets and language management classes, extensions and R.generated file

`Components` directory: Includes general components for all UI

**`Network`** directory: Includes services, models, and other core classes.

**`Utils`** directory: Includes helper classes and extensions

### Testing

The application includes both unit tests and UI tests to ensure the functionality is working as expected (6 Unit Test, 7 UI test)

## **Next Steps**

If the project had a bigger scope, the following enhancements could be considered:

- In the future, we can further divide the controller and viewModel layers into base classes to make control more centralized and easier. For example, for theme changes, language changes, or structural modifications.
- To ease the development process, we can create environments such as '`development`,' '`test`,' '`staging`,' and '`production`.
- Based on the previous point;
    - For each environment, we can create a configuration file and define environment-specific parameters in these files. For example, we can define param for `baseURL` structure under NetworkTargetType
    - Running certain code blocks specifically for each environment can provide security benefits. For example, the `NetworkLoggerPlugin` under `TProviderBuilder` can work only in the test environment
    - The error handler in the Network can be made more complex by providing a PluginType, allowing us to intercept specific cases like a `401` error. ex.
- By extracting BaseResponse structures, we can make the model returned from the backend more generic
- Listening network connection checks, we can throw internet connection errors throughout the app.
- By adding a retry action into **TNetwork**, we can handle cases that encounter errors at regular intervals.
- Instead of making the viewModel massive in cases of heavy network flows, we can create **Worker** classes and transfer the necessary request controls to these classes.
- If there are complex flows with multiple screens, we can add a **coordinator** layer to control the flow through controllers using enums. (convert to mvvm-c if needed)
