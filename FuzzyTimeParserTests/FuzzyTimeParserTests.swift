import XCTest
import FuzzyTimeParser

final class FuzzyTimeParserTestimeLikelyText: XCTestCase {

    func testFuzzyTimeParser() {
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "0h0m5s").timeInterval,     5.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "0h3m0s").timeInterval,   180.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "4h0m0s").timeInterval, 14400.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "1h2m0s").timeInterval,  3720.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "3h0m6s").timeInterval, 10806.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "0h2m3s").timeInterval,   123.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "4h2m3s").timeInterval, 14523.0)

        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "0h0m5").timeInterval,     5.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "0h3m0").timeInterval,   180.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "4h0m0").timeInterval, 14400.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "1h2m0").timeInterval,  3720.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "3h0m6").timeInterval, 10806.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "0h2m3").timeInterval,   123.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "4h2m3").timeInterval, 14523.0)

        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "00h00m05s").timeInterval,     5.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "00h03m00s").timeInterval,   180.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "04h00m00s").timeInterval, 14400.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "01h02m00s").timeInterval,  3720.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "03h00m06s").timeInterval, 10806.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "00h02m03s").timeInterval,   123.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "04h02m03s").timeInterval, 14523.0)

        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "5s").timeInterval,       5.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "3m").timeInterval,     180.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "4h").timeInterval,   14400.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "1h2m").timeInterval,  3720.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "3h6s").timeInterval, 10806.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "2m3s").timeInterval,   123.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "2m1h").timeInterval,  3720.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "6s3h").timeInterval, 10806.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "3s2m").timeInterval,   123.0)

        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "5S").timeInterval,       5.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "3M").timeInterval,     180.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "4H").timeInterval,   14400.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "1H2m").timeInterval,  3720.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "3h6S").timeInterval, 10806.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "2M3s").timeInterval,   123.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "2M1H").timeInterval,  3720.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "6s3H").timeInterval, 10806.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "3S2M").timeInterval,   123.0)

        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "1h1h2m").timeInterval,   7320.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "3h6s10").timeInterval,  10816.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "2m3s5m").timeInterval,    423.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "2m1h1m").timeInterval,   3780.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "6s3h11s").timeInterval, 10817.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "5m3s2m0").timeInterval,   423.0)

        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "5").timeInterval,         5.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "3.45").timeInterval,     3.45)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "89.2").timeInterval,     89.2)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "3h6").timeInterval,   10806.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "2m3.2").timeInterval,   123.2)

        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "1.2.3").timeInterval,                      1.2)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "01.20.3124").timeInterval,                 1.2)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "04.00.32.174").timeInterval,               4.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "01.20.3124h04.00.32.174").timeInterval, 4324.0)

        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "535s").timeInterval,         535.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "213m").timeInterval,       12780.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "942h").timeInterval,     3391200.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "111h72m").timeInterval,   403920.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "301h692s").timeInterval, 1084292.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "206m309s").timeInterval,   12669.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "72m111h").timeInterval,   403920.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "692s301h").timeInterval, 1084292.0)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "309s206m").timeInterval,   12669.0)

        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "535.8s").timeInterval,       535.8)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "213.56m").timeInterval,    12813.6)
        XCTAssertEqual(FuzzyTimeParser(timeLikelyText: "942.204h").timeInterval, 3391934.4)
        XCTAssertEqual(round(FuzzyTimeParser(timeLikelyText: "111.021h72.31m").timeInterval), round(404014.2))
        XCTAssertEqual(round(FuzzyTimeParser(timeLikelyText: "301.423h692.1s").timeInterval), round(1085814.9))
        XCTAssertEqual(round(FuzzyTimeParser(timeLikelyText: "206.12m309.4s").timeInterval),  round(12676.6))
        XCTAssertEqual(round(FuzzyTimeParser(timeLikelyText: "72.31m111.021h").timeInterval), round(404014.2))
        XCTAssertEqual(round(FuzzyTimeParser(timeLikelyText: "692.1s301.423h").timeInterval), round(1085814.9))
        XCTAssertEqual(round(FuzzyTimeParser(timeLikelyText: "309.4s206.12m").timeInterval),  round(12676.6))
    }

}
