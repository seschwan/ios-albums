//
//  Album.swift
//  iOS Albums
//
//  Created by Seschwan on 7/24/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import Foundation

struct Album: Codable {
    let artist: String
    let coverArt: [URL]
    let genres: [String]
    let id: UUID
    let name: String
    let songs: [Song]
    
    enum AlbumCodingKeys: String, CodingKey {
        case artist
        case coverArt
        case genres
        case id
        case name
        case songs
        
        enum CoverArtKeys: String, CodingKey {
            case url
        }
    }
    
    // MARK: - Decoder init
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AlbumCodingKeys.self)
        
        // Artist
        artist = try container.decode(String.self, forKey: .artist)
        
        // CoverArt
        var coverArtContainer = try container.nestedUnkeyedContainer(forKey: .coverArt)
        var coverArtURLs: [URL] = []
        
        while coverArtContainer.isAtEnd == false {
            let coverArtDescriptionContainer = try coverArtContainer.nestedContainer(keyedBy: AlbumCodingKeys.CoverArtKeys.self)
            let coverArtURL = try coverArtDescriptionContainer.decode(URL.self, forKey: .url)
            coverArtURLs.append(coverArtURL)
        }
        coverArt = coverArtURLs
        
        // Genres
        genres = try container.decode([String].self, forKey: .genres)
        
        // ID
        id = try container.decode(UUID.self, forKey: .id)
        
        // Name
        name = try container.decode(String.self, forKey: .name)
        
        // Songs
        songs = try container.decode([Song].self, forKey: .songs)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AlbumCodingKeys.self)
        
        // Artist
        try container.encode(self.artist, forKey: .artist)
        
        // CoverArt
        var coverArtContainer = container.nestedUnkeyedContainer(forKey: .coverArt)
        for coverArtURL in coverArt {
            var coverArtContainer = coverArtContainer.nestedContainer(keyedBy: AlbumCodingKeys.CoverArtKeys.self)
            try coverArtContainer.encode(coverArtURL, forKey: .url)
        }
        
        // Genres
        try container.encode(self.genres, forKey: .genres)
        // ID
        try container.encode(self.id, forKey: .id)
        // Name
        try container.encode(self.name, forKey: .name)
        // Songs
        try container.encode(self.songs, forKey: .songs)
        
    }
}

struct Song: Codable {
    let duration: String
    let id: UUID
    let name: String
    
    enum SongCodingKeys: String, CodingKey {
        case duration
        case id
        case name
        
        enum DurationCodingKeys: String, CodingKey {
            case duration
        }
        
        enum NameCodingKeys: String, CodingKey {
            case title
        }
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SongCodingKeys.self)
        
        // Duration
        let durationContainer = try container.nestedContainer(keyedBy: SongCodingKeys.DurationCodingKeys.self, forKey: .duration)
        duration = try durationContainer.decode(String.self, forKey: .duration)
        
        // ID
        id = try container.decode(UUID.self, forKey: .id)
        
        // Name
        let nameContainer = try container.nestedContainer(keyedBy: SongCodingKeys.NameCodingKeys.self, forKey: .name)
        name = try nameContainer.decode(String.self, forKey: .title)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: SongCodingKeys.self)
        // Duration
        var durationContainer = container.nestedContainer(keyedBy: SongCodingKeys.DurationCodingKeys.self, forKey: .duration)
        try durationContainer.encode(duration, forKey: .duration)
        // Name
        var nameContainer = container.nestedContainer(keyedBy: SongCodingKeys.NameCodingKeys.self, forKey: .name)
        try nameContainer.encode(name, forKey: .title)
        // ID
        try container.encode(id, forKey: .id)
    }
}
