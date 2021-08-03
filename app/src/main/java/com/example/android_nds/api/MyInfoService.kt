package com.example.android_nds.api

import com.example.android_nds.model.MyInfo
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Query

interface MyInfoService {
    // 내정보 보기
    @GET("member/jsonSelectMember.nds")
    fun getMyInfo(
//        @Query("mem_email") mem_email: String
    ): Call<MyInfo>
}