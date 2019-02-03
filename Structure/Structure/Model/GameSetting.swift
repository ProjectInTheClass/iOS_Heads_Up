//
//  GameSetting.swift
//  Structure
//
//  Created by 손희덕 on 24/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

//Players, Time, Contents를 지정하는 Class
//Players, Time 을 직접 입력받고, 선택한 Content의 정보를 Contents에서 상속받아서 사용한다.

import Foundation

class GameSetting {
    var settingPlayerCount : Int = 0
    var settingPlayer : Int?
    var timeLimit : Int?
    var playerScore : [Int]?

}
