//
//  MixColorsResultTests.swift
//  DemoTestTests
//
//  Created by Benjamin Dumont on 11/06/2021.
//

@testable import DemoTest
import XCTest
import XCTest_Gherkin

class MixColorsResultTests: XCTestCase {
    func test_should_return_red_when_both_colors_red() throws {
        // Arrange
        let color = PrimaryColorResult.red
        let expected = UIColor.red

        // Act
        let result = MixColorsResult().mixColors(color, color)

        // Assert
        XCTAssertEqual(expected, result)
    }

    func test_should_return_blue_when_both_colors_blue() throws {
        // Arrange
        let color = PrimaryColorResult.blue
        let expected = UIColor.blue

        // Act
        let result = MixColorsResult().mixColors(color, color)

        // Assert
        XCTAssertEqual(expected, result)
    }

    func test_should_return_yellow_when_both_colors_yellow() throws {
        // Arrange
        let color = PrimaryColorResult.yellow
        let expected = UIColor.yellow

        // Act
        let result = MixColorsResult().mixColors(color, color)

        // Assert
        XCTAssertEqual(expected, result)
    }

    func test_should_return_green_when_colors_yellow_and_blue() throws {
        // Arrange
        let color1 = PrimaryColorResult.yellow
        let color2 = PrimaryColorResult.blue
        let expected = UIColor.green

        // Act
        let result = MixColorsResult().mixColors(color1, color2)

        // Assert
        XCTAssertEqual(expected, result)
    }

    func test_should_return_green_when_colors_blue_and_yellow() throws {
        // Arrange
        let color1 = PrimaryColorResult.blue
        let color2 = PrimaryColorResult.yellow
        let expected = UIColor.green

        // Act
        let result = MixColorsResult().mixColors(color1, color2)

        // Assert
        XCTAssertEqual(expected, result)
    }

    func test_should_return_purple_when_colors_blue_and_red() throws {
        // Arrange
        let color1 = PrimaryColorResult.blue
        let color2 = PrimaryColorResult.red
        let expected = UIColor.purple

        // Act
        let result = MixColorsResult().mixColors(color1, color2)

        // Assert
        XCTAssertEqual(expected, result)
    }

    func test_should_return_purple_when_colors_red_and_blue() throws {
        // Arrange
        let color1 = PrimaryColorResult.red
        let color2 = PrimaryColorResult.blue
        let expected = UIColor.purple

        // Act
        let result = MixColorsResult().mixColors(color1, color2)

        // Assert
        XCTAssertEqual(expected, result)
    }

    func test_should_return_orange_when_colors_red_and_yellow() throws {
        // Arrange
        let color1 = PrimaryColorResult.red
        let color2 = PrimaryColorResult.yellow
        let expected = UIColor.orange

        // Act
        let result = MixColorsResult().mixColors(color1, color2)

        // Assert
        XCTAssertEqual(expected, result)
    }

    func test_should_return_orange_when_colors_yellow_and_red() throws {
        // Arrange
        let color1 = PrimaryColorResult.yellow
        let color2 = PrimaryColorResult.red
        let expected = UIColor.orange

        // Act
        let result = MixColorsResult().mixColors(color1, color2)

        // Assert
        XCTAssertEqual(expected, result)
    }

    func test_gherkin() throws {
        NativeRunner.runScenario(featureFile: "MixColorsResultTests.feature",
                                 scenario: "Couleurs primaires",
                                 testCase: self)
    }

    private final class StepsDefinition: StepDefiner {
        private var result: UIColor?
        private var color1: PrimaryColorResult?
        private var color2: PrimaryColorResult?

        private enum ColorGherkin: String, MatchedStringRepresentable {
            init?(fromMatch: String) {
                self.init(rawValue: fromMatch)
            }

            case red
            case blue
            case yellow
            case purple
            case green
            case orange

            var value: UIColor {
                switch self {
                case .red: return UIColor.red
                case .blue: return UIColor.blue
                case .yellow: return UIColor.yellow
                case .green: return UIColor.green
                case .orange: return UIColor.orange
                case .purple: return UIColor.purple
                }
            }

            var primaryValue: PrimaryColorResult? {
                switch self {
                case .blue: return .blue
                case .yellow: return .yellow
                case .red: return .red

                default:
                    return nil
                }
            }
        }

        override func defineSteps() {
            step("la couleur 1 est (.*)") { (match: ColorGherkin) in
                self.color1 = match.primaryValue
            }

            step("la couleur 2 est (.*)") { (match: ColorGherkin) in
                self.color2 = match.primaryValue
            }

            step("je mélange") {
                self.result = MixColorsResult().mixColors(self.color1!, self.color2!)
            }

            step("la couleur mélangée est (.*)") { (match: ColorGherkin) in
                XCTAssertEqual(self.result, match.value)
            }
        }
    }
}
