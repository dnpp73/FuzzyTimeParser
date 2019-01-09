import Foundation

public struct FuzzyTimeParser {

    public let timeLikelyText: String

    public let hour: TimeInterval
    public let minute: TimeInterval
    public let second: TimeInterval

    public let timeInterval: TimeInterval

    public init(timeLikelyText: String) {
        self.timeLikelyText = timeLikelyText

        let (h, h_trimmed)  = FuzzyTimeParser.findValue(pattern: "([0-9\\.]+)[hH]",  str: timeLikelyText)
        let (m, hm_trimmed) = FuzzyTimeParser.findValue(pattern: "([0-9\\.]+)[mM]",  str: h_trimmed)
        let (s, _)          = FuzzyTimeParser.findValue(pattern: "([0-9\\.]+)[sS]?", str: hm_trimmed)

        self.hour = h
        self.minute = m
        self.second = s
        self.timeInterval = (h * 3600.0 + m * 60.0 + s)
    }

    private static func findValue(pattern: String, str: String) -> (timeIntervalValue: TimeInterval, trimmed: String) {
        let regex: NSRegularExpression
        do {
            regex = try NSRegularExpression(pattern: pattern, options: [])
        }
        catch let error as NSError {
            print(error)
            fatalError()
        }

        let matches: [NSTextCheckingResult] = regex.matches(in: str, options: [], range: NSRange(location: 0, length: str.utf16.count))

        var value: Double = 0.0
        var str = NSString(string: str)

        for match in matches.reversed() {
            guard match.numberOfRanges == 2 else {
                continue
            }
            let hit: String = NSString(string: str).substring(with: match.range(at: 1))
            value += NSString(string: hit).doubleValue
            str = str.replacingCharacters(in: match.range(at: 0), with: "") as NSString
        }
        return (value, String(str))
    }

}
