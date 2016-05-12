import XCTest
@testable import FuzzyTimeParser

class FuzzyTimeParserTest: XCTestCase {
    
    func testFuzzyTimeParser() {
        XCTAssertEqual(FuzzyTimeParser(t: "0h0m5s").timeIntervalValue,     5.0)
        XCTAssertEqual(FuzzyTimeParser(t: "0h3m0s").timeIntervalValue,   180.0)
        XCTAssertEqual(FuzzyTimeParser(t: "4h0m0s").timeIntervalValue, 14400.0)
        XCTAssertEqual(FuzzyTimeParser(t: "1h2m0s").timeIntervalValue,  3720.0)
        XCTAssertEqual(FuzzyTimeParser(t: "3h0m6s").timeIntervalValue, 10806.0)
        XCTAssertEqual(FuzzyTimeParser(t: "0h2m3s").timeIntervalValue,   123.0)
        XCTAssertEqual(FuzzyTimeParser(t: "4h2m3s").timeIntervalValue, 14523.0)

        XCTAssertEqual(FuzzyTimeParser(t: "0h0m5").timeIntervalValue,     5.0)
        XCTAssertEqual(FuzzyTimeParser(t: "0h3m0").timeIntervalValue,   180.0)
        XCTAssertEqual(FuzzyTimeParser(t: "4h0m0").timeIntervalValue, 14400.0)
        XCTAssertEqual(FuzzyTimeParser(t: "1h2m0").timeIntervalValue,  3720.0)
        XCTAssertEqual(FuzzyTimeParser(t: "3h0m6").timeIntervalValue, 10806.0)
        XCTAssertEqual(FuzzyTimeParser(t: "0h2m3").timeIntervalValue,   123.0)
        XCTAssertEqual(FuzzyTimeParser(t: "4h2m3").timeIntervalValue, 14523.0)
        
        XCTAssertEqual(FuzzyTimeParser(t: "00h00m05s").timeIntervalValue,     5.0)
        XCTAssertEqual(FuzzyTimeParser(t: "00h03m00s").timeIntervalValue,   180.0)
        XCTAssertEqual(FuzzyTimeParser(t: "04h00m00s").timeIntervalValue, 14400.0)
        XCTAssertEqual(FuzzyTimeParser(t: "01h02m00s").timeIntervalValue,  3720.0)
        XCTAssertEqual(FuzzyTimeParser(t: "03h00m06s").timeIntervalValue, 10806.0)
        XCTAssertEqual(FuzzyTimeParser(t: "00h02m03s").timeIntervalValue,   123.0)
        XCTAssertEqual(FuzzyTimeParser(t: "04h02m03s").timeIntervalValue, 14523.0)
        
        XCTAssertEqual(FuzzyTimeParser(t: "5s").timeIntervalValue,       5.0)
        XCTAssertEqual(FuzzyTimeParser(t: "3m").timeIntervalValue,     180.0)
        XCTAssertEqual(FuzzyTimeParser(t: "4h").timeIntervalValue,   14400.0)
        XCTAssertEqual(FuzzyTimeParser(t: "1h2m").timeIntervalValue,  3720.0)
        XCTAssertEqual(FuzzyTimeParser(t: "3h6s").timeIntervalValue, 10806.0)
        XCTAssertEqual(FuzzyTimeParser(t: "2m3s").timeIntervalValue,   123.0)
        XCTAssertEqual(FuzzyTimeParser(t: "2m1h").timeIntervalValue,  3720.0)
        XCTAssertEqual(FuzzyTimeParser(t: "6s3h").timeIntervalValue, 10806.0)
        XCTAssertEqual(FuzzyTimeParser(t: "3s2m").timeIntervalValue,   123.0)
        
        XCTAssertEqual(FuzzyTimeParser(t: "5S").timeIntervalValue,       5.0)
        XCTAssertEqual(FuzzyTimeParser(t: "3M").timeIntervalValue,     180.0)
        XCTAssertEqual(FuzzyTimeParser(t: "4H").timeIntervalValue,   14400.0)
        XCTAssertEqual(FuzzyTimeParser(t: "1H2m").timeIntervalValue,  3720.0)
        XCTAssertEqual(FuzzyTimeParser(t: "3h6S").timeIntervalValue, 10806.0)
        XCTAssertEqual(FuzzyTimeParser(t: "2M3s").timeIntervalValue,   123.0)
        XCTAssertEqual(FuzzyTimeParser(t: "2M1H").timeIntervalValue,  3720.0)
        XCTAssertEqual(FuzzyTimeParser(t: "6s3H").timeIntervalValue, 10806.0)
        XCTAssertEqual(FuzzyTimeParser(t: "3S2M").timeIntervalValue,   123.0)
        
        XCTAssertEqual(FuzzyTimeParser(t: "1h1h2m").timeIntervalValue,   7320.0)
        XCTAssertEqual(FuzzyTimeParser(t: "3h6s10").timeIntervalValue,  10816.0)
        XCTAssertEqual(FuzzyTimeParser(t: "2m3s5m").timeIntervalValue,    423.0)
        XCTAssertEqual(FuzzyTimeParser(t: "2m1h1m").timeIntervalValue,   3780.0)
        XCTAssertEqual(FuzzyTimeParser(t: "6s3h11s").timeIntervalValue, 10817.0)
        XCTAssertEqual(FuzzyTimeParser(t: "5m3s2m0").timeIntervalValue,   423.0)
        
        XCTAssertEqual(FuzzyTimeParser(t: "5").timeIntervalValue,         5.0)
        XCTAssertEqual(FuzzyTimeParser(t: "3.45").timeIntervalValue,     3.45)
        XCTAssertEqual(FuzzyTimeParser(t: "89.2").timeIntervalValue,     89.2)
        XCTAssertEqual(FuzzyTimeParser(t: "3h6").timeIntervalValue,   10806.0)
        XCTAssertEqual(FuzzyTimeParser(t: "2m3.2").timeIntervalValue,   123.2)

        XCTAssertEqual(FuzzyTimeParser(t: "1.2.3").timeIntervalValue,                      1.2)
        XCTAssertEqual(FuzzyTimeParser(t: "01.20.3124").timeIntervalValue,                 1.2)
        XCTAssertEqual(FuzzyTimeParser(t: "04.00.32.174").timeIntervalValue,               4.0)
        XCTAssertEqual(FuzzyTimeParser(t: "01.20.3124h04.00.32.174").timeIntervalValue, 4324.0)
        
        XCTAssertEqual(FuzzyTimeParser(t: "535s").timeIntervalValue,         535.0)
        XCTAssertEqual(FuzzyTimeParser(t: "213m").timeIntervalValue,       12780.0)
        XCTAssertEqual(FuzzyTimeParser(t: "942h").timeIntervalValue,     3391200.0)
        XCTAssertEqual(FuzzyTimeParser(t: "111h72m").timeIntervalValue,   403920.0)
        XCTAssertEqual(FuzzyTimeParser(t: "301h692s").timeIntervalValue, 1084292.0)
        XCTAssertEqual(FuzzyTimeParser(t: "206m309s").timeIntervalValue,   12669.0)
        XCTAssertEqual(FuzzyTimeParser(t: "72m111h").timeIntervalValue,   403920.0)
        XCTAssertEqual(FuzzyTimeParser(t: "692s301h").timeIntervalValue, 1084292.0)
        XCTAssertEqual(FuzzyTimeParser(t: "309s206m").timeIntervalValue,   12669.0)
        
        XCTAssertEqual(FuzzyTimeParser(t: "535.8s").timeIntervalValue,       535.8)
        XCTAssertEqual(FuzzyTimeParser(t: "213.56m").timeIntervalValue,    12813.6)
        XCTAssertEqual(FuzzyTimeParser(t: "942.204h").timeIntervalValue, 3391934.4)
        XCTAssertEqual(round(FuzzyTimeParser(t: "111.021h72.31m").timeIntervalValue), round(404014.2))
        XCTAssertEqual(round(FuzzyTimeParser(t: "301.423h692.1s").timeIntervalValue), round(1085814.9))
        XCTAssertEqual(round(FuzzyTimeParser(t: "206.12m309.4s").timeIntervalValue),  round(12676.6))
        XCTAssertEqual(round(FuzzyTimeParser(t: "72.31m111.021h").timeIntervalValue), round(404014.2))
        XCTAssertEqual(round(FuzzyTimeParser(t: "692.1s301.423h").timeIntervalValue), round(1085814.9))
        XCTAssertEqual(round(FuzzyTimeParser(t: "309.4s206.12m").timeIntervalValue),  round(12676.6))
    }
    
}
