//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//https://theswiftdev.com/2018/07/17/swift-dependency-injection-design-pattern/
//: [Next](@next)

//So far, most of my posts and examples have used initializer-based dependency injection. However, just like with most programming techniques, there are multiple "flavors" of dependency injection - each with its own pros & cons. This week, let's take a look at three such flavors and how they can be used in Swift.

class FileLoader {
    private let fileManager: FileManager
    private let cache: URLCache

    init(fileManager: FileManager = .default,
         cache: URLCache = .init()) {
        self.fileManager = fileManager
        self.cache = cache
    }
}



print("Property-based")

//class PhotoEditorViewController: UIViewController {
//    var library: PhotoLibrary = PHPhotoLibrary.shared()
//    var engine = PhotoEditorEngine()
//}
//
//class PhotoEditorViewControllerTests: XCTestCase {
//    func testApplyingBlackAndWhiteFilter() {
//        let viewController = PhotoEditorViewController()
//
//        // Assign a mock photo library to gain complete control over
//        // what photos are stored in it
//        let library = PhotoLibraryMock()
//        library.photos = [TestPhotoFactory.photoWithColor(.red)]
//        viewController.library = library
//
//        // Run our testing commands
//        viewController.selectPhoto(atIndex: 0)
//        viewController.apply(filter: .blackAndWhite)
//        viewController.savePhoto()
//
//        // Assert that the outcome is correct
//        XCTAssertTrue(photoIsBlackAndWhite(library.photos[0]))
//    }
//}


var companyName: String?
print("\(companyName)")


var managerName: String
//print("\(managerName)")
