
import Foundation

public enum XCResultToolKitError: Error {
    case launchError([String], [String: String]?, Int)
}

public final class XCResultToolKit {

    public init() {

    }

    public func formatDescription(args: [String]) throws -> Data {
        return try xcresulttool(args: [
            "formatDescription",
            "get",
            "--format", "json",
            "--include-event-stream-types"
            ] + args)
    }

    public func xcresulttool(args: [String]) throws -> Data {
        return try launch(
            path: "/usr/bin/env",
            args: [
                "xcrun",
                "xcresulttool"
            ] + args,
            environment: [:]
        )
    }

    public func launch(path: String,
                       args: [String],
                       environment: [String: String] = ProcessInfo.processInfo.environment
                       ) throws -> Data {
        let process = Process()

        process.launchPath = path
        process.arguments = args
        process.environment = environment

        var standardErrorData = Data()
        process.standardError = pipeForReading(shouldLog: true) { (data) in
            standardErrorData.append(data)
        }

        var standardOutputData = Data()
        process.standardOutput = pipeForReading(shouldLog: false) { (data) in
            standardOutputData.append(data)
        }

        try process.run()

        process.waitUntilExit()

        if process.terminationStatus != EXIT_SUCCESS {
            throw XCResultToolKitError.launchError(args, process.environment, Int(process.terminationStatus))
        }
        return standardOutputData
    }

    func pipeForReading(shouldLog: Bool, onData: @escaping (Data) -> Void) -> Pipe {
        let pipe = Pipe()
        pipe.fileHandleForReading.readabilityHandler = { handle in
            let availableData = handle.availableData
            guard !availableData.isEmpty else {
                return
            }

            if shouldLog {
                if let text = String(data: availableData, encoding: .utf8) {
                    NSLog("\(text)")
                } else {
                    NSLog("Data: \(availableData)")
                }
            }

            onData(availableData)
        }
        return pipe
    }
}
