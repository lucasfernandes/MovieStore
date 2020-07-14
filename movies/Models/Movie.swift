//
//  Movie.swift
//  movies
//
//  Created by Lucas Silveira on 13/07/20.
//

import Foundation

struct Movie: Equatable, Identifiable {
    let id = UUID()
    var fullTitle: String
    var givenRating: Rating = .notSeen
}

extension Movie {
    enum Rating: Int, CaseIterable {
        case notSeen, terrible, poor, decent, good, excellent
    }
}

extension Movie.Rating {
    var localizedName: String {
        switch self {
        case .notSeen:
            return "Not watched"
        case .terrible:
            return "Terrible"
        case .poor:
            return "Poor"
        case .decent:
            return "Decent"
        case .good:
            return "Good"
        case .excellent:
            return "Excellent"
        }
    }
}
