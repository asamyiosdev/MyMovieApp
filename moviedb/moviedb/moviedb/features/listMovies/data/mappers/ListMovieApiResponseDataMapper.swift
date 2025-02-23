//
//  ListMovieApiResponseDataMapper.swift
//  moviedb
//
//  Created by Ahmed samy on 18/07/2024.
//

import Foundation

class ListMovieApiResponseDataMapper {
    static func fromApiMap(response: [String: Any]) -> ListMovieApiResponseDataModel {
        
        let datesDic = response.getDictionary("dates")
        let dates = Dates(maximum:datesDic.getString("maximum") , minimum: datesDic.getString("minimum"))
        
        let list = MovieDataMapper.fromListApiMap(list: response.getArray("results"))
        
        return ListMovieApiResponseDataModel(dates: dates ,
                                             page: response.getInt("page"),
                                             results: list, totalPages: response.getInt("totalPages"), totalResults: response.getInt("totalResults"))
        
    }
}

