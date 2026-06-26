//
//  Result.swift
//  Sxmpler27
//
//  Created by Andre jones on 6/22/26.
//
/*

Description:
Result acts as a wrapper for the returned music understanding returned values. For now it only supports key and bpm because that is all that is needed for the current app but feel free to add more. Refer to the musicUnderstanding documentation for all return types
Responsibilities:
    - Allow easy unambigous access to the music understanding result

Notes:
    - Feel free to add more!
*/

import Foundation

struct Result {
    var key: String
    var bpm: String
}
