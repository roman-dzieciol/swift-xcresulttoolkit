import Foundation


    public struct TypeMetaData {
        private enum CodingKeys: String, CodingKey {
            case name = "_name"
            case supertype = "_supertype"
            case type = "_type"
            case value = "_value"
            case values = "_values"
        }
    }

    public struct _Value<T: Codable>: Codable {
        public let _value: T
    }

    public struct _Values<T: Codable>: Codable {
        public let _values: T
    }

    public struct _SuperType: Codable {
        public let _name: String
    }

    public struct _Type: Codable {
        public let _name: String
        public let _supertype: _SuperType?


//                public required init(from decoder: Decoder) throws {
//                    let container = try decoder.container(keyedBy: CodingKeys.self)
//                    let typeMetaData = try container.decode(TypeMetaData.self, forKey: .name)
//                    typeName = typeMetaData._name
//                    supertypeName = typeMetaData._supertype?._name
//                }
//
//                public  func encode(to encoder: Encoder) throws {
//                    var container = encoder.container(keyedBy: CodingKeys.self)
//                    try container.encode(name, forKey: .name)
//                    try container.encodeIfPresent(supertype, forKey: .supertype)
//                }

//
    }
    
//
//    public struct TypeValueDescription: Codable {
//        public let _name: String
//        public let _value: SuperTypeNameDescription?
//    }
//
//    public struct TypeNameDescription: Codable {
//        public let _name: String
//        public let _supertype: SuperTypeNameDescription?
//    }

//    public class TypeNameDescription: Codable {
//
//
//        public let typeName: String
//        public let supertypeName: String?
//
//        private enum CodingKeys: String, CodingKey {
//            case name = "_name"
//            case supertype = "_supertype"
//            case type = "_type"
//            case value = "_value"
//            case values = "_values"
//        }
//
//        public init(
//            typeName: String,
//            supertypeName: String?
//            ) {
//            self.typeName = typeName
//            self.supertypeName = supertypeName
//        }
//
//        public required init(from decoder: Decoder) throws {
//            let container = try decoder.container(keyedBy: CodingKeys.self)
//            let typeMetaData = try container.decode(TypeMetaData.self, forKey: .name)
//            typeName = typeMetaData._name
//            supertypeName = typeMetaData._supertype?._name
//        }
//
//        public  func encode(to encoder: Encoder) throws {
//            var container = encoder.container(keyedBy: CodingKeys.self)
////            try container.encode(name, forKey: .name)
////            try container.encodeIfPresent(supertype, forKey: .supertype)
//        }
//    }


