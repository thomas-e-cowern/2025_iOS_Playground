import Foundation
import OSLog
import SwiftUI

fileprivate let logger: Logger = Logger(subsystem: "com.mobilesoftwareservices.SkipBudget", category: "SkipBudget")

/// The Android SDK number we are running against, or `nil` if not running on Android
let androidSDK = ProcessInfo.processInfo.environment["android.os.Build.VERSION.SDK_INT"].flatMap({ Int($0) })

/// The shared top-level view for the app, loaded from the platform-specific App delegates below.
///
/// The default implementation merely loads the `ContentView` for the app and logs a message.
public struct RootView : View {
    public init() {
        initializeSchema()
    }
    
    private func initializeSchema() {
        do {
            let sqlContext = SQLContextProvider.sharedSQLContent
            try sqlContext.exec(sql:
            """
            CREATE TABLE IF NOT EXISTS Budgets (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            amount REAL NOT NULL
            );
            """
            )
        } catch {
            print("Error in initializeSchema: \(error.localizedDescription)")
        }
        
    }

    public var body: some View {
        ContentView()
            .task {
                logger.log("Welcome to Skip on \(androidSDK != nil ? "Android" : "Darwin")!")
                logger.warning("Skip app logs are viewable in the Xcode console for iOS; Android logs can be viewed in Studio or using adb logcat")
            }
    }
}

#if !SKIP
public protocol SkipBudgetApp : App {
}

/// The entry point to the SkipBudget app.
/// The concrete implementation is in the SkipBudgetApp module.
public extension SkipBudgetApp {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
#endif
