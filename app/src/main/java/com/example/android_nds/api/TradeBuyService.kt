package com.example.android_nds.api

import com.example.android_nds.model.TradeBuy
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Query

interface TradeBuyService {
    // 중고거래 구매내역
    @GET("member/selectMyTradeAndroid.nds")
    fun getTradeBuy(
//        @Query("mem_nickname") mem_nickname: String,
        @Query("gubun") gubun: String
    ): Call<List<TradeBuy>>
}