/*
//  PeliculaModel.swift
//  BibliotecaPeliculas
//
//  Created by Mikel Cobian on 14/4/22.
//

import Foundation

struct MovieResponse: Decodable, Identifiable {
        var id:Int?
        let adult: Bool?
        let backdropPath: String?
        let budget: Int?
        let genres: [Genre]?
        let homepage: String?
        let imdbID, originalLanguage, originalTitle, overview: String?
        let popularity: Double?
        let posterPath: String?
        let releaseDate: String?
        let revenue, runtime: Int?
        let status, tagline, title: String?
        let video: Bool?
        let voteAverage: Double?
        let voteCount: Int?

        enum CodingKeys: String, CodingKey {
            case adult
            case backdropPath = "backdrop_path"
            case budget, genres, homepage, id
            case imdbID = "imdb_id"
            case originalLanguage = "original_language"
            case originalTitle = "original_title"
            case overview, popularity
            case posterPath = "poster_path"
            case releaseDate = "release_date"
            case revenue, runtime
            case status, tagline, title, video
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }
}

// MARK: - Genre
struct Genre: Decodable {
    let id: Int?
    let name: String?
}

struct PeliculasFilter: Codable{
    var name:String?
} */

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let peliculaModel = try? newJSONDecoder().decode(PeliculaModel.self, from: jsonData)

import Foundation

/// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let peliculaModel = try? newJSONDecoder().decode(PeliculaModel.self, from: jsonData)



// MARK: - PeliculaModel
struct MovieResponse: Codable {
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Result: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
