// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let redditResponse = try? newJSONDecoder().decode(RedditResponse.self, from: jsonData)

import Foundation

// MARK: - RedditResponse
public struct RedditResponse: Codable {
    let kind: String?
    let data: RedditResponseData?
}

// MARK: - RedditResponseData
public struct RedditResponseData: Codable {
    let modhash: String?
    let dist: Int?
    let children: [Child]?
    let after: String?
    let before: JSONNull?
}

// MARK: - Child
public struct Child: Codable {
    //let kind: Kind?
    let kind: String?
    let data: ChildData?
}

// MARK: - ChildData
public struct ChildData: Codable {
    let title: String?
    let thumbnailHeight: Int?
    let thumbnailWidth: Int?
    let score: Int?
    let numComments: Int?
    let thumbnail: String?

    enum CodingKeys: String, CodingKey {
        case title
        case thumbnailHeight = "thumbnail_height"
        case thumbnail
        case thumbnailWidth = "thumbnail_width"
        case score
        case numComments = "num_comments"
    }
}

// MARK: - AllAwarding
public struct AllAwarding: Codable {
    let giverCoinReward: Int?
    let subredditID: SubredditID?
    let isNew: Bool?
    let daysOfDripExtension, coinPrice: Int?
    let id: String?
    let pennyDonate: Int?
    let awardSubType: AwardSubType?
    let coinReward: Int?
    let iconURL: String?
    let daysOfPremium: Int?
    let tiersByRequiredAwardings: [String: TiersByRequiredAwarding]?
    let resizedIcons: [ResizedIcon]?
    let iconWidth, staticIconWidth: Int?
    let startDate: JSONNull?
    let isEnabled: Bool?
    let awardingsRequiredToGrantBenefits: Int?
    let allAwardingDescription: String?
    let endDate: JSONNull?
    let subredditCoinReward, count, staticIconHeight: Int?
    let name: String?
    let resizedStaticIcons: [ResizedIcon]?
    let iconFormat: Format?
    let iconHeight: Int?
    let pennyPrice: Int?
    let awardType: AwardType?
    let staticIconURL: String?

    enum CodingKeys: String, CodingKey {
        case giverCoinReward = "giver_coin_reward"
        case subredditID = "subreddit_id"
        case isNew = "is_new"
        case daysOfDripExtension = "days_of_drip_extension"
        case coinPrice = "coin_price"
        case id
        case pennyDonate = "penny_donate"
        case awardSubType = "award_sub_type"
        case coinReward = "coin_reward"
        case iconURL = "icon_url"
        case daysOfPremium = "days_of_premium"
        case tiersByRequiredAwardings = "tiers_by_required_awardings"
        case resizedIcons = "resized_icons"
        case iconWidth = "icon_width"
        case staticIconWidth = "static_icon_width"
        case startDate = "start_date"
        case isEnabled = "is_enabled"
        case awardingsRequiredToGrantBenefits = "awardings_required_to_grant_benefits"
        case allAwardingDescription = "description"
        case endDate = "end_date"
        case subredditCoinReward = "subreddit_coin_reward"
        case count
        case staticIconHeight = "static_icon_height"
        case name
        case resizedStaticIcons = "resized_static_icons"
        case iconFormat = "icon_format"
        case iconHeight = "icon_height"
        case pennyPrice = "penny_price"
        case awardType = "award_type"
        case staticIconURL = "static_icon_url"
    }
}

enum AwardSubType: String, Codable {
    case appreciation = "APPRECIATION"
    case community = "COMMUNITY"
    case global = "GLOBAL"
    case group = "GROUP"
    case premium = "PREMIUM"
}

enum AwardType: String, Codable {
    case community = "community"
    case global = "global"
}

enum Format: String, Codable {
    case apng = "APNG"
    case png = "PNG"
}

// MARK: - ResizedIcon
public struct ResizedIcon: Codable {
    let url: String?
    let width, height: Int?
    let format: Format?
}

enum SubredditID: String, Codable {
    case t52Qiel = "t5_2qiel"
    case t52Th52 = "t5_2th52"
    case t52U6VG = "t5_2u6vg"
}

// MARK: - TiersByRequiredAwarding
public struct TiersByRequiredAwarding: Codable {
    let resizedIcons: [ResizedIcon]?
    let awardingsRequired: Int?
    let staticIcon: ResizedIcon?
    let resizedStaticIcons: [ResizedIcon]?
    let icon: ResizedIcon?

    enum CodingKeys: String, CodingKey {
        case resizedIcons = "resized_icons"
        case awardingsRequired = "awardings_required"
        case staticIcon = "static_icon"
        case resizedStaticIcons = "resized_static_icons"
        case icon
    }
}

// MARK: - FlairRichtext
public struct FlairRichtext: Codable {
    let e: AuthorFlairRichtextE?
    let t, a: String?
    let u: String?
}

enum AuthorFlairRichtextE: String, Codable {
    case emoji = "emoji"
    case text = "text"
}

enum FlairTextColor: String, Codable {
    case dark = "dark"
}

enum FlairType: String, Codable {
    case richtext = "richtext"
    case text = "text"
}

enum Edited: Codable {
    case bool(Bool)
    case integer(Int)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Bool.self) {
            self = .bool(x)
            return
        }
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        throw DecodingError.typeMismatch(Edited.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Edited"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let x):
            try container.encode(x)
        case .integer(let x):
            try container.encode(x)
        }
    }
}

// MARK: - Gildings
public struct Gildings: Codable {
    let gid1, gid2, gid3: Int?

    enum CodingKeys: String, CodingKey {
        case gid1 = "gid_1"
        case gid2 = "gid_2"
        case gid3 = "gid_3"
    }
}

enum LinkFlairBackgroundColor: String, Codable {
    case empty = ""
    case the00A6A5 = "#00a6a5"
    case the7193Ff = "#7193ff"
    case the94E044 = "#94e044"
}

// MARK: - Media
public struct Media: Codable {
    let redditVideo: RedditVideo?
    let oembed: Oembed?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case redditVideo = "reddit_video"
        case oembed, type
    }
}

// MARK: - Oembed
public struct Oembed: Codable {
    let providerURL, url: String?
    let html, authorName: String?
    let height: JSONNull?
    let width: Int?
    let version: String?
    let authorURL: String?
    let providerName: String?
    let cacheAge: Int?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case providerURL = "provider_url"
        case url, html
        case authorName = "author_name"
        case height, width, version
        case authorURL = "author_url"
        case providerName = "provider_name"
        case cacheAge = "cache_age"
        case type
    }
}

// MARK: - RedditVideo
public struct RedditVideo: Codable {
    let bitrateKbps: Int?
    let fallbackURL: String?
    let height, width: Int?
    let scrubberMediaURL: String?
    let dashURL: String?
    let duration: Int?
    let hlsURL: String?
    let isGIF: Bool?
    let transcodingStatus: String?

    enum CodingKeys: String, CodingKey {
        case bitrateKbps = "bitrate_kbps"
        case fallbackURL = "fallback_url"
        case height, width
        case scrubberMediaURL = "scrubber_media_url"
        case dashURL = "dash_url"
        case duration
        case hlsURL = "hls_url"
        case isGIF = "is_gif"
        case transcodingStatus = "transcoding_status"
    }
}

// MARK: - MediaEmbed
public struct MediaEmbed: Codable {
    let content: String?
    let width: Int?
    let scrolling: Bool?
    let height: Int?
    let mediaDomainURL: String?

    enum CodingKeys: String, CodingKey {
        case content, width, scrolling, height
        case mediaDomainURL = "media_domain_url"
    }
}

// MARK: - MediaMetadata
public struct MediaMetadata: Codable {
    let the88Nilrn5Dyo61, pdor5Ce7Byo61, the8S7Zgnoc9Yo61, the3Jkkmr6S9Yo61: Yo61?
    let the4Lwxbc0Jayo61, the65Lcq6Bl3Yo61, the8Tig9E58Byo61, the6Kg131Ln2Yo61: Yo61?
    let t9H35Mzxcyo61: T9H35Mzxcyo61?
    let rlxl4Jjh8Yo61, qixhtkc9Dyo61, snaw8Zrx5Yo61: Yo61?

    enum CodingKeys: String, CodingKey {
        case the88Nilrn5Dyo61 = "88nilrn5dyo61"
        case pdor5Ce7Byo61 = "pdor5ce7byo61"
        case the8S7Zgnoc9Yo61 = "8s7zgnoc9yo61"
        case the3Jkkmr6S9Yo61 = "3jkkmr6s9yo61"
        case the4Lwxbc0Jayo61 = "4lwxbc0jayo61"
        case the65Lcq6Bl3Yo61 = "65lcq6bl3yo61"
        case the8Tig9E58Byo61 = "8tig9e58byo61"
        case the6Kg131Ln2Yo61 = "6kg131ln2yo61"
        case t9H35Mzxcyo61 = "t9h35mzxcyo61"
        case rlxl4Jjh8Yo61 = "rlxl4jjh8yo61"
        case qixhtkc9Dyo61 = "qixhtkc9dyo61"
        case snaw8Zrx5Yo61 = "snaw8zrx5yo61"
    }
}

// MARK: - Yo61
public struct Yo61: Codable {
    let status: Status?
    let e: The3Jkkmr6S9Yo61E?
    let m: M?
    let p: [S]?
    let s: S?
    let id: String?
}

enum The3Jkkmr6S9Yo61E: String, Codable {
    case image = "Image"
}

enum M: String, Codable {
    case imageJpg = "image/jpg"
    case imagePNG = "image/png"
}

// MARK: - S
public struct S: Codable {
    let y, x: Int?
    let u: String?
}

enum Status: String, Codable {
    case valid = "valid"
}

// MARK: - T9H35Mzxcyo61
public struct T9H35Mzxcyo61: Codable {
    let status: Status?
    let e: String?
    let dashURL: String?
    let x, y: Int?
    let hlsURL: String?
    let id: String?
    let isGIF: Bool?

    enum CodingKeys: String, CodingKey {
        case status, e
        case dashURL = "dashUrl"
        case x, y
        case hlsURL = "hlsUrl"
        case id
        case isGIF = "isGif"
    }
}

enum WhitelistStatus: String, Codable {
    case allAds = "all_ads"
    case someAds = "some_ads"
}

enum PostHint: String, Codable {
    case hostedVideo = "hosted:video"
    case image = "image"
    case link = "link"
    case postHintSelf = "self"
}

// MARK: - Preview
public struct Preview: Codable {
    let images: [Image]?
    let redditVideoPreview: RedditVideo?
    let enabled: Bool?

    enum CodingKeys: String, CodingKey {
        case images
        case redditVideoPreview = "reddit_video_preview"
        case enabled
    }
}

// MARK: - Image
public struct Image: Codable {
    let source: ResizedIcon?
    let resolutions: [ResizedIcon]?
    let variants: Variants?
    let id: String?
}

// MARK: - Variants
public struct Variants: Codable {
    let gif, mp4: GIF?
}

// MARK: - GIF
public struct GIF: Codable {
    let source: ResizedIcon?
    let resolutions: [ResizedIcon]?
}

enum SubredditType: String, Codable {
    case subredditTypePublic = "public"
}

enum Kind: String, Codable {
    case t3 = "t3"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
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

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
