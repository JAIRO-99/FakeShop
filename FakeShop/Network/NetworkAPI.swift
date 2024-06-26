




import Foundation

enum APError: Error{
    
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    case decodingError
}

@Observable
class NetworkAPI {
    
    static let shared = NetworkAPI()
    static let urlBase = "https://fakestoreapi.com/products"
    
    func getListOfProducts(completed: @escaping (Result<[ShopModel], APError>) -> Void){
        
        guard let url = URL(string: NetworkAPI.urlBase)else{
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error{
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else{
                completed(.failure(.invalidData))
                return
            }
            do{
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode([ShopModel].self, from: data)
                completed(.success(decodedResponse))
            }catch{
                print("Debug: Error \(error.localizedDescription)")
                completed(.failure(.decodingError))
            }
        }
        task.resume()
    }
    
}

