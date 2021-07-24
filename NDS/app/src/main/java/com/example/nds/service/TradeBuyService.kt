package com.example.nds.service

import com.example.nds.model.TradeBuy
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Query

interface TradeBuyService {
    @GET("member/selectMyTradeAndroid.nds")
    fun getTradeBuy(
        @Query("mem_nickname") mem_nickname: String,
        @Query("gubun") gubun: String
    ): Call<List<TradeBuy>>

    @GET("member/deleteTradeRec.nds")
    fun deleteTradeBuy(
        @Query("mem_nickname") mem_nickname: String,
        @Query("pr_bm_no") pr_bm_no: String
    ): Call<List<TradeBuy>>
}