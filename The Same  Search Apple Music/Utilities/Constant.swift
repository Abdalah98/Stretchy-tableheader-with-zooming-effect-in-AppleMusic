//
//  Constant.swift
//  Breaking Bad
//
//  Created by Abdallah on 6/15/21.
//

import Foundation

enum URLS {
    
    static let country            = "eg"
    static let resultsLimit       = "100"
    static let mediaType          = "apple-music"

    static let main               = "https://rss.itunes.apple.com"
    static let entity             =  main + "/api/v1/\(country)/\(mediaType)/"
    
    static let topSongs           = entity + "top-songs/all/\(resultsLimit)/explicit.json"
    static let topAlbums          = entity + "top-albums/all/\(resultsLimit)/explicit.json"
    static let newReleases        = entity + "new-releases/all/\(resultsLimit)/explicit.json"
    static let hotTracks          = entity + "hot-tracks/all/\(resultsLimit)/explicit.json"
    static let comingSoon         = entity + "coming-soon/all/\(resultsLimit)/explicit.json"
}




enum Constant {
    
    static let browseHeaderHorizontalCell  			= "BrowseHeaderHorizontalCell"
    
    static let browseReusableView          			= "BrowseReusableView"
    static let browseFooterCell            			= "BrowseFooterCell"
    static let browseCell                  			= "BrowseCell"
    static let detailsCell                 			= "DetailsCell"
    static let searchCell                  			= "SearchCell"
    static let goDetailsMusicVideo                  = "GoDetailsMusicVideo"
    
    static let searchDetailsCell                    = "SearchDetailsCell"

    
}


