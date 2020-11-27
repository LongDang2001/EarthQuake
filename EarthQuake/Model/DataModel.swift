
import Foundation

// MARK: - Welcome
class QuakeInfo: Codable {
    let placeFirst: String?
    let placeSecond: String?
    var timeInterval: TimeInterval?
    let type: String
    let metadata: Metadata
    var features: [Feature]
    let bbox: [Double]
}

// MARK: - Feature
struct Feature: Codable {
    let type: FeatureType
    var properties: Properties
    let geometry: Geometry
    let id: String
}

// MARK: - Geometry
struct Geometry: Codable {
    let type: GeometryType
    let coordinates: [Double]
}

enum GeometryType: String, Codable {
    case point = "Point"
}

// MARK: - Properties
class Properties: Codable {
    var mag: Double
    let place: String
    var time, updated: Int
    let tz: JSONNull?
    let url: String
    var detail: String
    let felt: Int?
    let cdi, mmi: Double?
    let alert: String?
    let status: Status
    let tsunami, sig: Int
    let net: Net
    let code, ids: String
    let sources: Sources
    let types: String
    let nst: Int?
    let dmin, rms, gap: Double
    let magType: MagType
    let type: PropertiesType
    let title: String
    
    
    
}

enum MagType: String, Codable {
    case mb = "mb"
    case ml = "ml"
    case mwr = "mwr"
    case mww = "mww"
}

enum Net: String, Codable {
    case nn = "nn"
    case pr = "pr"
    case us = "us"
}

enum Sources: String, Codable {
    case nnUs = ",nn,us,"
    case ptUsPR = ",pt,us,pr,"
    case us = ",us,"
}

enum Status: String, Codable {
    case reviewed = "reviewed"
}

enum PropertiesType: String, Codable {
    case earthquake = "earthquake"
}

enum FeatureType: String, Codable {
    case feature = "Feature"
}

// MARK: - Metadata
struct Metadata: Codable {
    let generated: Int
    let url: String
    let title: String
    let status: Int
    let api: String
    let count: Int
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

