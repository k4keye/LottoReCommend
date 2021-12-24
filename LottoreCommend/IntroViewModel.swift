//
//  IntroPresenter.swift
//  LottoreCommend
//
//  Created by k4keye on 2021/12/23.
//

import Foundation
import RxSwift

class IntroViewModel {
    let lottoModel = LottoModel.init()
    
    var progressValue : Observable<Float> = Observable<Float>.of(0.3)
    var nextPage : Observable<Bool> = Observable<Bool>.of(false)

    
    func validLottoData(){
        
        let allLottoEntity = lottoModel.getAllLottoEntity()
        var currentKey = allLottoEntity.count + 1 //가장 마지막 인덱스가 회차이다.

        while true {

            let lottoEntity  = lottoModel.getLottoData(drwNo: currentKey)
            if(lottoEntity.state){
                lottoModel.storeLottoEntity(data: lottoEntity)

                currentKey += 1
            }else{
                self.progressValue = Observable<Float>.of(1.0)
                self.nextPage = Observable<Bool>.of(true)
                break
            }
        }

       
    }
    
    
    
}