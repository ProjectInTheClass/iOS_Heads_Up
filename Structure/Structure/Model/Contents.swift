//
//  Contents.swift
//  Structure
//
//  Created by 손희덕 on 24/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

// Content에 대한 정보를 관리하는 부분
// Favorit 기능
// Custum으로 생성된 Content를 관리



// 서버와의 연결

import Foundation
import Firebase
import FirebaseFirestore

public struct Content
{
    var allCategory: [String] = ["한국영화", "외국영화", "한국드라마", "외국드라마", "K-POP(가수)", "K-POP(제목)", "스카이캐슬", "보헤미안 랩소디", "동물"]
    
    func InitContents(title : String) -> [String] {
        switch title {
        case "한국영화":
            return ["명랑","신과함께","국제시장","베테랑","도둑들","7번방의 선물","암살","광해","택시운전사","부산행","극한직업","명랑"]
        case "외국영화":
            return ["아바타","어벤저스","인터스텔라","겨울왕국","보헤미안 렙소디","아이언맨","캡틴 아메리카"]
        case "한국드라마":
            return ["SKY캐슬","미스터 션사인","남자친구","황후의 품격","태양의 후예","도깨비","킹덤","라이브","시그널","해를 품은 달","비밀의 숲","미생"]
        case "외국드라마":
            return ["프리즌 브레이크","기묘한 이야기","왕좌의 게임","워킹데드","아메리칸 갓","마블 퍼니셔","더 기프티드","슈퍼네추럴"]
        case "K-POP(가수)":
            return ["방탄소년단","블랙핑크","레드벨벳","EXO","B.I","TWICE","빅뱅","슈퍼주니어","싸이","소녀시대","박진영","아이유","HOT","동방신기"]
        case "K-POP(제목)":
            return ["Forever Young","에너제틱","여름여름해","1도없어","갖고 싶어","Power Ip","빙글뱅글","Baby Baby","뚜두뚜두","TT","빨간맛"]
        case "보헤미안 랩소디":
            return ["프레디 머큐리","로저 테일러","레이 포스터","브라이언 메이","메리 오스틴","존 디콘","존 레이드"]
        case "동물" :
            return ["기니피그","꽃사슴","당나귀","쓰시마삵","가창오리","두루미","원앙","그린 아구아나","남생이","자라","줄무늬 뱀"]
        default:
            return ["해당 컨텐츠가 없습니다. 다시 시도해 주세요"]
        }
    }
    
    var contents : [String]?
    /*
    init(index : Int, word: [String], title:String) {
        self.index = index
        self.word = word
        self.title = title
    }
 */

}

    
    /*func shuffleContent () {
     for shuffleCount in contents.indices {
     let randomValue = Int(arc4random_uniform(UInt32(contents.count)))
     let temp = contents[shuffleCount]
     contents[shuffleCount] = contents[randomValue]
     contents[randomValue] = temp
     }
     }
     */
/*
    let newUrl = Bundle.main.url(forResource: "contentsSource2", withExtension: "json")
    /*mutating func getdata() {
        guard let j = newUrl
            else{
                print("data not found")
                return
        }
        
        guard let d = try? Data(contentsOf: j)
            else { print("failed")
                return
                
        }
        
        guard let rootJSON = try? JSONSerialization.jsonObject(with: d, options: []) as! [String : Any]
            else{ print("failedh")
                return
                
        }*/
        
      /*  if let JSON = rootJSON as? [String: Any] {
            
            // (컨텐츠 제목 들어갈 라벨명).text = JSON["name"] as? String
            
            guard let jsonArray = JSON["list"] as? [[String: Any]] else {
                return
            }
            print(jsonArray) // jsonArray에서는
            
            //gnuk's To Do : JSON파일에서 "list"로 부터 받아온 파일이 지금 [[String : Any]] 로 되어있음
            //  [[String : Any]] 을 getContentsData = [String : Any] 로 풀고
            //dictoinary make to Array cods is
            /*
             let getContentsData : [Any]?
             
             print(getContentsData)
             
             //   var anyContents = Array(getContentsData.values) //[String : Any] dictionary를 [Any] array로 변경
             
             //contents = anyContents as? [String] // [Any] Array 를 [String]로 설정
             print(contents)
             */
        }
     }*/



*/

