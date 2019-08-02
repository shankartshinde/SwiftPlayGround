//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//: [Next](@next)
print("Case:1. Async Global Queue with mode .background and .userInteractive  ")
DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async {
    for i in 0...10 {
        print("🥰 : \(i)")
    }
}


DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
    for i in 0...10 {
        print("🥳 : \(i)")
    }
}


print("Case:2. Async Global Queue with mode .userInteractive, and Sync Gloabal Queue with .background mode ")
print("Result This finish all sync task then start new task in async")
print("As you can see although the userInteractive thread has higher priority it wasn’t executed at all until the first sync task was completed.")
DispatchQueue.global(qos: DispatchQoS.QoSClass.background).sync {
    for i in 0...10 {
        print("😈 : \(i)")
    }
}

DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async {
    for i in 0...10 {
        print("🥰 : \(i)")
    }
}


print(" Print Emoji using ctrl+command+spacebar")
print("case 3 Custom Queues:")
var concurrantQueue = DispatchQueue.init(label: "concurrantQueue", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent)

var serialQueue = DispatchQueue.init(label: "serialQueue", qos: DispatchQoS.background)

// https://www.swiftbysundell.com/posts/a-deep-dive-into-grand-central-dispatch-in-swift
// https://theswiftdev.com/2018/07/10/ultimate-grand-central-dispatch-tutorial-in-swift/


class SearchViewController: UIViewController, UISearchBarDelegate {
    // We keep track of the pending work item as a property
    private var pendingRequestWorkItem: DispatchWorkItem?
    let resultsLoader : ResultLoader
    init(loader:ResultLoader) {
        self.resultsLoader = loader
        super.init(nibName: "SearchViewController", bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Cancel the currently pending item
        pendingRequestWorkItem?.cancel()
        
        // Wrap our request in a work item
        let requestWorkItem = DispatchWorkItem { [weak self] in
            self?.resultsLoader.loadResults(forQuery: searchText)
        }
        
        // Save the new work item and execute it after 250 ms
        pendingRequestWorkItem = requestWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(250),
                                      execute: requestWorkItem)
    }
}

class ResultLoader {
    func loadResults(forQuery:String)  {
        
    }
}

// Constructor initalization Dependency injection
var loader = ResultLoader()
var serachViewController = SearchViewController(loader: loader)
