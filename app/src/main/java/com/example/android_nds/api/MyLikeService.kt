package com.example.android_nds.api

import com.example.android_nds.model.Mylike
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Query

interface MyLikeService {
    // 찜 목록
    @GET("myPage/my_likeAndroid.nds")
    fun getMyLike(
//        @Query("mem_email") mem_email: String
    ): Call<List<Mylike>>
}