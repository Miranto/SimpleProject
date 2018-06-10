//
//  Photo.swift
//  SimpleProject
//
//  Created by Mateusz Mirkowski on 07/06/2018.
//  Copyright © 2018 Mateusz Mirkowski. All rights reserved.
//

import Mapper

class Photo: Mappable {
  
  var id: Int?
  var title: String?
  var thumbUrl: String?
  
  required init(map: Mapper) throws {
    id = map.optionalFrom("id") ?? 0
    title = map.optionalFrom("title") ?? ""
    thumbUrl = map.optionalFrom("thumbnailUrl") ?? ""
  }
  
}
