//
//  AlbumController.swift
//  iOS Albums
//
//  Created by Seschwan on 7/24/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import Foundation

class AlbumController {
    
    func testDecodingExampleAlbum() {
        let bundle = Bundle.main.url(forResource: "exampleAlbum", withExtension: "json")!
        
        do {
            let data = try Data(contentsOf: bundle)
            let album = try JSONDecoder().decode(Album.self, from: data)
            print(album)
        } catch {
            NSLog("Error decoding the data: \(error)")
        }
    }
    
    func testEncodingExampleAlbum() {
        let bundle = Bundle.main.url(forResource: "exampleAlbum", withExtension: "json")!
        
        do {
            let data = try Data(contentsOf: bundle)
            let album = try JSONDecoder().decode(Album.self, from: data)
            print("Decoded: \(album)")
            
            let encodedAlbum = try JSONEncoder().encode(album)
            print("Encoded: \(album)")
            

        } catch {
            NSLog("Error decoding the data: \(error)")
        }
    }
}
