//
//  IAPService.swift
//  Fal Kalesi
//
//  Created by Yusuf DEMİRKOPARAN on 5.03.2019.
//  Copyright © 2019 Study. All rights reserved.
//

import Foundation
import UIKit
import StoreKit
class IAPService : NSObject {
    
    
    // MARK: - Properties ****
    
    private override init() {}
    static let shared = IAPService()
    var products = [SKProduct]()
    let paymentQueue = SKPaymentQueue.default()
    
    // MARK : - Handlers ****
    
    // MARK: - Fetchin Products ID's
    func getProducts() {
        let products: Set = [IAPProduct.BuyCredits.rawValue,
                             IAPProduct.GetCredit.rawValue,]
        let request = SKProductsRequest(productIdentifiers: products)
        request.delegate = self
        request.start()
        
        
        paymentQueue.add(self)
        
    }
    
    
    // MARK: - Purchase Products
    
    func Purchase(product: IAPProduct){
        
        guard let productToPurchase = products.filter(// it gives which consumble
            { $0.productIdentifier == product.rawValue }).first
            else { return }
        
        let payment = SKPayment(product: productToPurchase)
        paymentQueue.add(payment)
        
        
    }
    
    
}

extension IAPService : SKProductsRequestDelegate {
    
    // MARK: - Check Products ID
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
        self.products = response.products // payment type saved
        
        
        for product in response.products {
            print(product.localizedTitle)
        }
        
        response.invalidProductIdentifiers.forEach { product in
            print("Invalid: \(product)")
        }
        
        response.products.forEach { product in
            print("Valid: \(product)")
            
        }
        func request(_ request: SKRequest, didFailWithError error: Error) {
            print("Error for request: \(error.localizedDescription)")
        }
    }
    
    
}


extension IAPService : SKPaymentTransactionObserver {
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            print(transaction.transactionState)
            print(transaction.transactionState.status(), transaction.payment.productIdentifier)
        }
    }
}

extension SKPaymentTransactionState {
    
    func status () -> String {
        switch self {
        case .deferred   : return  ("deffered")
        case .failed     : return  ("failed")
        case .purchased  : return  ("purchased")
        case .purchasing : return  ("purchasing")
        case .restored   : return  ("restored")
        }
    }
}
