//
//  CyanTableViewController.swift
//  CyanHelps
//
//  Created by CenoX on 2017/06/08.
//  Copyright © 2017 CenoX. All rights reserved.
//

import UIKit

struct Sample {
    var name: String
    var genre: Genre
}

let songSamples =   [Sample(name: "TEKKEN 7", genre: .namco),
                     Sample(name: "TEKKEN 6", genre: .namco),
                     Sample(name: "이 씨발 내가 남코", genre: .namco),
                     Sample(name: "노래를 어케 알아", genre: .namco),
                     Sample(name: "ㅁㅓㅅㅣㄱㅣ2000", genre: .namco),
                     Sample(name: "Kart rider BGM", genre: .game),
                     Sample(name: "LoL rank game BGM", genre: .game),
                     Sample(name: "ㅇㅓㅁㅓㄴㅣMansumugang", genre: .game),
                     Sample(name: "Yume Tourou", genre: .jpop),
                     Sample(name: "ZenZenZense", genre: .jpop),
                     Sample(name: "Winter 4th", genre: .classic),
                     Sample(name: "Night of nights", genre: .variety),
                     Sample(name: "Help me, ERIIIIIIN", genre: .variety),
                     Sample(name: "I have no mother", genre: .variety),
                     Sample(name: "Melt", genre: .vocaloid),
                     Sample(name: "DEAD END of Hatsune Miku", genre: .vocaloid),
                     Sample(name: "SPiCa", genre: .vocaloid),
                     Sample(name: "Weekend Girl", genre: .vocaloid),
                     Sample(name: "The iDOLM@STER", genre: .anime),
                     Sample(name: "Bokurawa imano nakade", genre: .anime),
                     Sample(name: "Watashi kininarimasu!", genre: .anime),
                     Sample(name: "164 fuck you", genre: .anime),
                     Sample(name: "ANIME SONG", genre: .anime),
                     Sample(name: "NiUmMa 3000 Won.", genre: .anime)
]

class CyanTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.title = "Song List"
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let data = songSamples.filter { $0.genre.genreTag() == indexPath.section }[indexPath.row] //별거는 없음, indexPath라는 놈이 대충 (section, row)로 이루어진 좌표값 비스무리한놈인데, 한 섹션 당 몇개가 들어있다고 아래에서 알려줬으므로, 그냥 장르의 태그가 섹션과 일치하는지만 보면 됨.
        cell.textLabel?.text = data.name
        cell.detailTextLabel?.text = data.genre.rawValue // Genre 라는 enum이 String 타입으로 선언되었기 때문에 그것의 raw값은 선언 시 적었던 놈이 됨
        cell.detailTextLabel?.textColor = data.genre.genreColor() // Genre 라는 enum안에 넣었던 함수
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 7 // 총 Genre의 갯수
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songSamples.filter { $0.genre.genreTag() == section }.count
        // 대충 말하면 섹션 내에 줄이 몇개 들었냐 라는걸 알려주는건데, songSamples 자체에 필터를 걸어서 $0(잡히는 Sample)의 genre에서 genreTag()를 뜯어낸 뒤(Int값임) 그것이 section과 일치하는지 보고 그 것의 갯수를 반환함
        // 즉 차례대로 보자면, songSamples 안에서 모든 값들 중 genreTag()의 값이 section과 일치하는 것만 고르고 그것만 들어있는 새 Array를 반환함.
        // 즉 songSamples.filter { $0.genre.genreTag() == section } <- 요놈은 알맹이의 tag가 section과 일치한 새 [Sample] Array임 개꿀 함수형언어 개간편함
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Genre.init(with: section).rawValue
        // 이놈 때문에 Genre 에다가 enum이 Int형으로 선언되어야 할 것 같다고 적은건데, 얘는 정말 말 그대로 Section의 Header Title이기 때문에 고정 된 값을 줘야 하잖슴? 어차피 섹션을 훑고 내려가는 거나 타이틀을 훑고 내려가는거나 마찬가지이기 때문에 그냥 저렇게 줬음
    }

}
