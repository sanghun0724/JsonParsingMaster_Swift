import Foundation

struct GroceryProduct: Codable {
    var name: String
    var points: Int
    var description: String?
}

/// 스위프트 4 버전부터 """를 통해 여러 줄 문자열을 사용할 수 있습니다.
let json = """
{
    "name": "banana",
    "points": 1000,
    "description": "A fruit"
}
""".data(using: .utf8)!

let decoder = JSONDecoder()

do {
    let product = try decoder.decode(GroceryProduct.self, from: json)
    print(product.name)
} catch {
    print(error)
}
