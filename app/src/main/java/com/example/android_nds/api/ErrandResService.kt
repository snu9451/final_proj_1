package com.example.android_nds.api

import com.example.android_nds.model.ErrandRes
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Query

interface ErrandResService {
    @GET("errand/selectErrandRecordAndroid.nds")
    fun getErrandRes(
//        @Query("mem_email") mem_email: String,
        @Query("gubun") gubun: String
    ): Call<List<ErrandRes>>
}