//
//  File.swift
//  
//
//  Created by Roman Dzieciol on 7/21/19.
//

import Foundation

public struct SchemaKeyedDecodingContainer<T> : KeyedDecodingContainerProtocol where T: KeyedDecodingContainerProtocol {

    public typealias Key = T.Key

    public var container: T

    public var codingPath: [CodingKey] {
        return container.codingPath
    }

    public var allKeys: [Key] {
        return container.allKeys
    }

    public init(container: T) {
        self.container = container
    }

    public func contains(_ key: Key) -> Bool {
        return container.contains(key)
    }

    public func decodeNil(forKey key: Key) throws -> Bool {
        return try container.decodeNil(forKey: key)
    }

    public func decode(_ type: Bool.Type, forKey key: Key) throws -> Bool {
        return try container.decode(type, forKey: key)
    }

    public func decode(_ type: String.Type, forKey key: Key) throws -> String {
        return try container.decode(type, forKey: key)
    }

    public func decode(_ type: Double.Type, forKey key: Key) throws -> Double {
        return try container.decode(type, forKey: key)
    }

    public func decode(_ type: Float.Type, forKey key: Key) throws -> Float {
        return try container.decode(type, forKey: key)
    }

    public func decode(_ type: Int.Type, forKey key: Key) throws -> Int {
        return try container.decode(type, forKey: key)
    }

    public func decode(_ type: Int8.Type, forKey key: Key) throws -> Int8 {
        return try container.decode(type, forKey: key)
    }

    public func decode(_ type: Int16.Type, forKey key: Key) throws -> Int16 {
        return try container.decode(type, forKey: key)
    }

    public func decode(_ type: Int32.Type, forKey key: Key) throws -> Int32 {
        return try container.decode(type, forKey: key)
    }

    public func decode(_ type: Int64.Type, forKey key: Key) throws -> Int64 {
        return try container.decode(type, forKey: key)
    }

    public func decode(_ type: UInt.Type, forKey key: Key) throws -> UInt {
        return try container.decode(type, forKey: key)
    }

    public func decode(_ type: UInt8.Type, forKey key: Key) throws -> UInt8 {
        return try container.decode(type, forKey: key)
    }

    public func decode(_ type: UInt16.Type, forKey key: Key) throws -> UInt16 {
        return try container.decode(type, forKey: key)
    }

    public func decode(_ type: UInt32.Type, forKey key: Key) throws -> UInt32 {
        return try container.decode(type, forKey: key)
    }

    public func decode(_ type: UInt64.Type, forKey key: Key) throws -> UInt64 {
        return try container.decode(type, forKey: key)
    }

    public func decode<T>(_ type: T.Type, forKey key: Key) throws -> T where T : Decodable {
        return try container.decode(type, forKey: key)
    }

    public func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type, forKey key: Key) throws -> KeyedDecodingContainer<NestedKey> where NestedKey : CodingKey {
        return try container.nestedContainer(keyedBy: type, forKey: key)
    }

    public func nestedUnkeyedContainer(forKey key: Key) throws -> UnkeyedDecodingContainer {
        return try container.nestedUnkeyedContainer(forKey: key)
    }

    public func superDecoder() throws -> Decoder {
        return try container.superDecoder()
    }

    public func superDecoder(forKey key: Key) throws -> Decoder {
        return try container.superDecoder()
    }
}
