//
//  Genre.swift
//  CyanHelps
//
//  Created by CenoX on 2017/06/08.
//  Copyright © 2017 CenoX. All rights reserved.
//

import Foundation
import UIKit

/**
 솔직히 Genre는 enum은 Int로 정의되는게 맞다고 생각함.
 tag라는 것을 써서 테이블뷰에 이름이나 섹션을 비교하기 때문에, Int로 정의되고 차라리 desciption() 이라는 함수를 추가해서 설명을 적는게 나을텐데
 
 그냥 따라 보고 만들다보니 이렇게 나와서 대충 수정해뒀음
 수정법은 직접 연구해보시길>_<
 */
enum Genre: String {
    case namco = "Namco"
    case game = "Game"
    case jpop = "J-Pop"
    case classic = "Classic"
    case variety = "Veriety"
    case vocaloid = "Vocaloid"
    case anime = "Animation"
    
    static func `init`(with tag: Int) -> Genre {
        switch tag {
        case 0: return .namco
        case 1: return .game
        case 2: return .jpop
        case 3: return .classic
        case 4: return .variety
        case 5: return .vocaloid
        case 6: return .anime
        default: fatalError()
        }
    }
    
    func genreTag() -> Int {
        switch self {
        case .namco: return 0
        case .game: return 1
        case .jpop: return 2
        case .classic: return 3
        case .variety: return 4
        case .vocaloid: return 5
        case .anime: return 6
        }
    }
    
    func genreColor() -> UIColor {
        switch self {
        case .namco: return .namco
        case .game: return .game
        case .jpop: return .jpop
        case .classic: return .classic
        case .variety: return .variety
        case .vocaloid: return .vocaloid
        case .anime: return .anime
        }
    }
}
