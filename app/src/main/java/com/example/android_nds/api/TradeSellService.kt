package com.example.android_nds.api

import com.example.android_nds.model.TradeSell
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Query

interface TradeSellService {
    // 중고거래 판매내역
    @GET("member/selectMyTradeAndroid.nds")
    fun getTradeSell(
//        @Query("mem_nickname") mem_nickname: String,
        @Query("gubun") gubun: String
    ): Call<List<TradeSell>>
}