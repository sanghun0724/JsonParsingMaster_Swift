import UIKit

//ref: https://zeddios.tistory.com/394
let jsonString = """
{
"name" : "Lee"
"age" : 24
"brith_date" : "2021-01-23A34:12:30.222"
}
"""
//이렇게 birt_date처럼 스네이크 케이스가 있는 문자열은 Decoding이 X -> Codingkey 사용함으로 써 해결

struct Person: Codable {
    var name : String
    var age : Int
    var birthday : Date


enum CodingKeys : String,CodingKey {
    // Json에서 Key는 항상 Sting이니 Raw value타입으로 String 타입 선택
    case name
    case age
    case birthday = "birth_date"
}
}
 //여기까지 Coding key OK
 //하지만 아직 끝 x .iso8601형식(->>birthday문자열)을 파싱하려면. ?

let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .iso8601 //파싱전략 지정

let Assetdata = NSDataAsset(name: "jsonSting")!

if let myPerson = try? decoder.decode(Person.self, from: Assetdata.data) {
    print(myPerson.name) //LEE
    print(myPerson.age) //24
    print(myPerson.birthday) // "2021-01-23A34:12:30.222"
}
