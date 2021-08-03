package com.example.android_nds.api

import com.example.android_nds.model.CoinTrans
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Query

interface CoinTransService {
    // 거래내역
    @GET("/myPage/my_WalletAndroid.nds")
    fun getcoinTrans(
//        @Query("mem_email") mem_email: String
    ): Call<List<CoinTrans>>
}