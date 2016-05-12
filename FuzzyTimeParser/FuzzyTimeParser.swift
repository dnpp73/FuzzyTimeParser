import Foundation

struct FuzzyTimeParser {
    
    let t: String
    
    let h, m, s: Double
    
    init(t: String) {
        self.t = t
        
        func parseValueWithPattern(pattern: String, str: String) -> (value: Double, trimmed: String) {
            let regex: NSRegularExpression
            do {
                regex = try NSRegularExpression(pattern: pattern, options: [])
            }
            catch let error as NSError {
                print(error)
                fatalError()
            }
            
            let matches: [NSTextCheckingResult] = regex.matchesInString(str, options: [], range: NSRange(location: 0, length: str.utf16.count))
            
            var value: Double = 0.0
            var str = NSString(string: str)
            
            for match in matches.reverse() {
                guard match.numberOfRanges == 2 else {
                    continue
                }
                let hit: String = NSString(string: str).substringWithRange(match.rangeAtIndex(1))
                value += NSString(string: hit).doubleValue
                str = str.stringByReplacingCharactersInRange(match.rangeAtIndex(0), withString: "")
            }
            return (value, String(str))
        }
        
        let (h, h_trimmed)  = parseValueWithPattern("([0-9\\.]+)[hH]",  str: t)
        let (m, hm_trimmed) = parseValueWithPattern("([0-9\\.]+)[mM]",  str: h_trimmed)
        let (s, _)          = parseValueWithPattern("([0-9\\.]+)[sS]?", str: hm_trimmed)
        
        self.h = h
        self.m = m
        self.s = s
    }
    
    var timeIntervalValue: NSTimeInterval {
        get {
            return NSTimeInterval(h * 3600.0 + m * 60.0 + s)
        }
    }
    
}
