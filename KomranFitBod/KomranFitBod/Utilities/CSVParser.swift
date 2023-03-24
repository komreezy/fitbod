//
//  CSVParser.swift
//  KomranFitBod
//
//  Created by Komran Ghahremani on 3/12/23.
//

import Foundation

protocol CSVParser {
    func loadContent<T: CSVLoaded>(forResource: String, withExtension: String, using separator: String) throws -> [T]
}

/// For mapping the values in the init array
typealias CSVAttributePair = (String, Any)

/// Type for the models that are being loaded by the CSVParser
/// Ensuring that they have an initializer that can handle the return of `loadContent`
protocol CSVLoaded {
    static var attributes: [CSVAttributePair] { get }
    
    init(array: [String])
}

extension CSVParser {
    /// Assumes format of parsing each new line into an array separated by commas
    func loadContent<T>(forResource: String, withExtension: String, using separator: String) throws -> [T] where T : CSVLoaded {
        guard let url = Bundle.main.url(forResource: forResource, withExtension: withExtension) else {
            fatalError("Unable to locate file")
        }
        
        do {
            // Parse into a collection of arrays that will be converted into type T
            // Can make the Type itself conform to protocol so that it can have init(array: [String])
            let content = try String(contentsOf: url)
            let data: [[String]] =
                content
                    .components(separatedBy: "\n")
                    .compactMap { component in
                        // this to get rid of any malformed data, since we are assuming no optionals
                        // also takes care of the new line at the end of the file
                        let attributes = component.components(separatedBy: separator)
                        return attributes.count == T.attributes.count ? attributes : nil
                    }
            
            print(data)
            
            // Use the generic T to generate our models and pass them back to the caller
            let models = data.compactMap { T.init(array: $0) }
            return models
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
}

/// Not much to it right now but option is there in the future for adding more around the process
/// that is specific to parsing workout data in particular
struct WorkoutDataParser: CSVParser {
    typealias T = ExerciseSet
}
