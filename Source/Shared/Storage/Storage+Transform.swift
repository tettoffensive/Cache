import Foundation

public extension Storage {
  #if os(Linux)
  #else
  func transformData() -> Storage<Data> {
    let storage = transform(transformer: TransformerFactory.forData())
    return storage
  }

  func transformImage() -> Storage<Image> {
    let storage = transform(transformer: TransformerFactory.forImage())
    return storage
  }
  #endif
  func transformCodable<U: Codable>(ofType: U.Type) -> Storage<U> {
    let storage = transform(transformer: TransformerFactory.forCodable(ofType: U.self))
    return storage
  }
}
