import Foundation

//MARK: JSONEncoder
struct GroceryProduct:Codable {
    var name:String
    var points:Int
    var description:String?
}

let apple = GroceryProduct(name: "APPLE", points: 500, description: "맛있는 사과")

let encoder = JSONEncoder() //JsonEncoder 객체 만들어주기
encoder.outputFormatting = .prettyPrinted //pretty하게 출력될수있게 설정

do {
    let data = try encoder.encode(apple)
    print(String(data:data,encoding: .utf8)!)
} catch {
    print(error)
}
// 쓰다가 갑자기 든 의문점 왜 try catch 문을 쓸까..?
// 궁금하신분은 https://groups.google.com/g/comp.lang.c++.moderated/c/4QnotaeS3ZE?pli=1 참고!



