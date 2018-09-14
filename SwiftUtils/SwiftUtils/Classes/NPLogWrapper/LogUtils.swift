//
//  NPLogWrapper.swift
//  HtmlLearning
//
//  Created by NPC on 08/06/18.
//  Copyright © 2018 NPC. All rights reserved.
//

import Foundation
//import XCGLogger

struct LogsConfiguration {
    static let NumberOfFiles : UInt = 2
    static let MaximumFileSize : UInt = 100 // in kilobytes.
    
    static let ConsoleLogging = "yyyy-MM-dd HH:mm:ss.SSS"
}

class LogUtils {
    
    static let LogDiagnosticPath = "/NPLogs"
    static let ConsoleLogFolder = "/ConsoleLog"
    static let ConsoleLogFilePath = "log_file.text"
    
    //private static let log = XCGLogger.default
    
    // MARK:- Singleton Creation
    
    class func getRoloLogsFolder() -> URL?{
        let fileManager = FileManager.default
        var filePath : URL?
        if let tDocumentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            filePath =  tDocumentDirectory.appendingPathComponent("\(LogDiagnosticPath)")
            if filePath != nil {
                if !fileManager.fileExists(atPath: filePath!.path) {
                    do {
                        try fileManager.createDirectory(atPath: filePath!.path, withIntermediateDirectories: true, attributes: nil)
                    } catch {
                        NSLog("Couldn't create document directory \(filePath!.path)")
                        return nil
                    }
                }
            }
        }
        return filePath
    }
    
    class func getLogsFilePath(_ actualFilePath : String, dontRemove : Bool = false) -> URL?{
        let fileManager = FileManager.default
        let logsFolder = getRoloLogsFolder()
        let filePath = logsFolder!.appendingPathComponent("\(actualFilePath)")
        if fileManager.fileExists(atPath: filePath.path){
            if !dontRemove{
                NSLog("Log file already exist: So trying to remove.. @getLogsFilePath")
                do {
                    try fileManager.removeItem(atPath: filePath.path)
                } catch {
                    NSLog("Log file already exist: So trying to remove.. : Failed @getLogsFilePath")
                    return nil
                }
            }
        }else {
            let text = "******************** NPC Logging *************************"
            try? text.write(to: filePath, atomically: false, encoding: String.Encoding.utf8)
            print(text)
        }
        
        
        NSLog("Document directory is \(filePath.debugDescription)")
        return filePath
    }
    
    class func getConsoleLogFilePath() -> URL? {
        //return getLogsFilePath(LogUtils.ConsoleLogFolder + "/" + LogUtils.ConsoleLogFilePath,dontRemove: true)
        return getLogsFilePath(LogUtils.ConsoleLogFilePath,dontRemove: true)
    }
    
    class func setup(){
        print("Logs setup done.......")
        /*if LogUtils.log.destinations.count == 1 {
            LogUtils.log.setup(level: .debug, showLogIdentifier: false, showFunctionName: false, showThreadName: false, showLevel: false, showFileNames: false, showLineNumbers: false, showDate: true)
            
            if let logurl = LogUtils.getConsoleLogFilePath() {
                let fileDestination = FileDestination.init(owner: LogUtils.log, writeToFile:logurl,  identifier: "NpcAppLogs.AdvancedLogSystem", shouldAppend: true, appendMarker: "-- ** ** ** --", attributes: nil)
                // Optionally set some configuration options
                fileDestination.outputLevel = .debug
                fileDestination.showFunctionName = false
                fileDestination.showLevel = false
                fileDestination.showFileName = false
                fileDestination.showLineNumber = false
                fileDestination.showDate = true
                // Process this destination in the background
                fileDestination.logQueue = XCGLogger.logQueue
                
                // Add the destination to the logger
                log.add(destination: fileDestination)
            }
        }*/
    }
    
    class func errorLog(_ args : String...){
        print(args)
        //LogUtils.log.error(args)
    }
    
    class func debugLog(_ args : String...){
        #if DEBUG
            print(args)
            //LogUtils.log.debug(args)
        #endif
    }
}
