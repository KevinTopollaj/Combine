import Foundation

public struct Quote: Codable {
    public let quoteText: String
    public let author: String
    
    public init(quoteText: String, author: String) {
        self.quoteText = quoteText
        self.author = author
    }
}
