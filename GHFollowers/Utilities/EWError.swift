//
//  ErrorMessage.swift
//  GHFollowers
//
//  Created by Elliot Waddington on 23/10/2020.
//

import Foundation

enum EWError: String, Error {
  case invalidUsername = "Invalid username. Please try again."
  case unableToComplete = "Unable to complete request. Please check your internet connection."
  case invalidResponse = "Invalid response from the server. Please try again."
  case invalidData = "The data received was invalid. Please try again."
}
