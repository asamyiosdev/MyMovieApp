//
//  MovieDataMapper.dart.swift
//  moviedb
//
//  Created by Ahmed samy on 18/07/2024.
//

import Foundation

class MovieDataMapper {
    static func fromApiMap(response: [String: Any]) -> MovieDataModel {
        return MovieDataModel(adult: response.getBool("adult"),
                              backdropPath: response.getString("backdrop_path"),
                              genreIDS: response.getArray("genre_ids") as? [Int] ?? [],
                              id: response.getInt("id"),
                              originalLanguage: OriginalLanguage.en,
                              originalTitle: response.getString("original_title"),
                              overview: response.getString("overview"),
                              popularity: 0,
                              posterPath: response.getString("poster_path"),
                              releaseDate: response.getString("release_date"),
                              title: response.getString("title"),
                              video: response.getBool("video"),
                              voteAverage: 0,
                              voteCount: response.getInt("vote_count"))
        
        
    }
    
    
    static func fromListApiMap(list: [Any]) -> [MovieDataModel] {
        return list.compactMap { item in
                  guard let itemDict = item as? [String: Any] else { return nil }
                  return fromApiMap(response: itemDict)
              }
    }
    
    
}
