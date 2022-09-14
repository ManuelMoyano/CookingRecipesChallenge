//
//  NetWorking.swift
//  CookingRecipesChallenge
//
//  Created by Manuel Moyano on 13/09/2022.
//

import Foundation
import Alamofire

final class NetWorking {
    static let shared = NetWorking()
    private init (){}
    
    func getCookingRecipesAlamofire (success: @escaping (_ recipes: [CookingRecipe])->(), failure: @escaping (_ error: Error?)->()){
        
        let url = "https://hf-android-app.s3-eu-west-1.amazonaws.com/android-test/recipes.json"
        
        AF.request(url, method: .get).responseDecodable(of: [CookingRecipe].self) { response in
            
            if let recipesResponse = response.value {
                print ("Se cargaron las recetas")
                success(recipesResponse)
            } else {
                print ("No se encontraron las recetas por el error: \(String(describing: response.error))")
                failure(response.error)
            }
        }
        
    }
    
    
}
