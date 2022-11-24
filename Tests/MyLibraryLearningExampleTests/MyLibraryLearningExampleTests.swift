import XCTest
import SwiftUI
@testable import MyLibraryLearningExample

final class MyLibraryLearningExampleTests: XCTestCase {
  
    
    func testExample() throws {
        @State var text: String
        
        var body: some View {
            MyLibraryLearningExample.MainTextField(placeholder: "Testing", text: $text)
        }
    }
}
