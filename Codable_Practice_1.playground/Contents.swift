import UIKit

/*
 {
 "name":"lee"
 "age":24
 "address":{
 "conuntry":"korea"
 "city":"seoul"
 }
 */

struct Person:Codable{
    
    struct Address:Codable{
        let country:String
        let city:String
    }
    
    let name:String
    let age:Int
    let address:Address
}

//이 데이터들을 배열로 활용하려면??

var person:[Person] = []

let jsonDecoder:JSONDecoder = JSONDecoder()
let dataAsset:NSDataAsset = NSDataAsset(name: "person")! //원래는 값이 없을수도 있어서 guard 주로 사용
// NSDataAsset???? -> https://nshipster.co.kr/nsdataasset/ //dataAsset에 json file이 있다고 가정

do {
    person = try jsonDecoder.decode([Person].self,from: dataAsset.data)
} catch {
    print(error.localizedDescription)
}

