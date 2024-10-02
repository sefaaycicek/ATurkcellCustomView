import UIKit
import Foundation

/*class Person {
    let name : String
    init(name: String) {
        print("\(name) init edildi")
        self.name = name
    }
    
    deinit {
        print("\(name) deinit edildi")
    }
}

var person1 : Person? = Person(name: "Ahmet") // referenceCount +1
var person2 : Person? = person1  // referenceCount +1 = 2
var person3 : Person? = person1  // referenceCount +1 = 2

person1 = nil // referenceCount -1 = 1
person2?.name
person2 = nil // referenceCount -1 = 0
person3?.name
person3 = nil*/

// async
// await
// Task
// async let
// MainActor

/*func fetchData() async -> String {
    print("veriler çekiliyor")
    
    try? await Task.sleep(nanoseconds: 5000000000)
    
    return "veriler alındı"
    
    //try await Task.sleep(nanoseconds: 5000000000)
    
    /*do {
    
    } catch is CancellationError {
        
    } catch is DecodingError {
       
    } catch is EncodingError {
        
    }*/
    
}

func callData()  {
    Task {
        let value = await fetchData()
        print("islem tamamlandı : \(value)")
        
        // UI update
        
        await MainActor.run { // DispatchQueue.main'in karşılığu, işlemi UI thread içerisinde gerçekleştirmek için.
            // table.reloadData()
        }
    }
    print("devam dostum")
}

callData()*/





// Methodları ard arda çağırır
/*func callMethod()  {
    Task {
        let value1 = await fetcFirstData()
        print("islem tamamlandı : \(value1)")
        
        let value2 = await fetcSecondData()
        print("islem tamamlandı : \(value2)")
    }
    
}*/

/*func callMethod()  {
    Task {
        await fetcFirstData()
    }

    Task {
        await fetcSecondData()
    }
    
    print("")
}*/

// async let process'lerin paralel başlaması ama akışın tümü tamamlandıktan sonra devam etmesini istediğimiz durumlarda.

/*func fetcFirstData() async -> String {
    try? await Task.sleep(nanoseconds: 5000000000)
    return "birince veri alındı"
}

func fetcSecondData() async -> String {
    try? await Task.sleep(nanoseconds: 10000000000)
    return "ikinci veri alındı"
}

func callMethod()  {
    Task {
        async let first = fetcFirstData()
        async let second = fetcSecondData()
        
        let result1 = await first
        let result2 = await second
        
        print("islem tamamlandı : \(result1)")
        print("islem tamamlandı : \(result2)")
    }
    
    print("")
}

callMethod()
*/

struct PostResponse : Codable {
    let data : [Post]?
}

struct Post : Codable {
    let postId : Int
    let title : String?
    let body : String?
    
    enum CodingKeys : String, CodingKey {
        case postId = "id"
        case title, body
    }
}


func fetchPosts2(callBack : ([Post]?)->Void) {
    let urlString = "https://jsonplaceholder.typicode.com/posts"
    guard let url = URL(string: urlString) else { return }
    let urlRequest = URLRequest(url: url)
    /*urlRequest.httpMethod = "POST"
    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
    urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authentication")*/
    
    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
        if let data = data {
            let posts = try? JSONDecoder().decode([Post].self, from: data)
           // callBack(posts)
        }
    }.resume()
  

    //JSONEncoder()
}

func fetchPosts() async throws -> [Post]? {
    let urlString = "https://jsonplaceholder.typicode.com/posts"
    guard let url = URL(string: urlString) else { return nil }
    /*let urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
    urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authentication")*/
    
    let (data, urlResponse) = try await URLSession.shared.data(from: url)
    print(urlResponse)
    return try JSONDecoder().decode([Post].self, from: data)
    
    //JSONEncoder()
}


func callMethod() {
    Task {
        do {
            let post = try await fetchPosts()
            post?.forEach { print($0.title ?? "") }
        } catch {
            print("Exception occured : \(error) ")
        }
    }
    
    
    /*fetchPosts2 { posts in
        posts?.forEach { print($0.title ?? "") }
    }*/
    
    print("")
    
}

callMethod()
