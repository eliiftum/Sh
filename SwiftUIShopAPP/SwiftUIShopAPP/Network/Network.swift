//
//  Network.swift
//  SwiftUIShopAPP
//
//  Created by Elif Tum on 28.01.2023.
//

import Foundation


struct Network {
    //Struct Singleton Yapıldı
    static let shared = Network() // shared üzerinden network katmanına singleton yaptık. bu sayede uygulama ilk açıldığında static olarak yüklendi ve ona shared üzerinden hep aynı noktaya erişebildik
    
    
    func getNetwork<E:Codable>(url:String?,completion:@escaping (Result<E,Error>)->()) { // <E:Codable- generic type demek
        //codable: json dosyasını bir modele ya da modeli json dosyasına çevirmaye yarayan swift protokolüdür. decode-encode edilebilir hale getirir, bu işi kendiis yapmaz sadece yapılabilir hale getirir. biz bu işlemi -JSONDecoder().decode(E.self, from: data)- ile yaparız
        guard let url = URL(string: url ?? "") else {return}
        let session = URLSession.shared
        session.dataTask(with: URLRequest(url: url)) { data, response, error in
            //url session data task swift'in native olarak network isteklerini gerçekleştirmemize yarayan class'ıdır. data respons ve error şeklinde bize üç parametre döndürür. bu parametreleri kontrol ederek istediğimizin başarısını ölçebilirizi. işlemin tamamlanması için data task fonksiyonun bitimine .resume() koymayı unutmamlıyız
            if let data = data {
                do {
                    let decoded = try JSONDecoder().decode(E.self, from: data)
                    completion(.success(decoded))
                }
                catch {
                    print(String(describing: error))
                    print(error.localizedDescription)
                }
            }
            if let error = error {
                completion(.failure(error))
            }
        }
        .resume()
    }
}
