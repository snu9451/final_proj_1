package com.example.android_nds

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import androidx.constraintlayout.widget.ConstraintLayoutStates
import com.bumptech.glide.Glide
import com.example.android_nds.databinding.ActivityMyInfoBinding
import com.example.android_nds.model.MyInfo
import com.example.android_nds.interceptor.LoginHandleInterceptor
import com.example.android_nds.api.MyInfoService
import okhttp3.OkHttpClient
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

class MyInfoActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMyInfoBinding
    private lateinit var myInfoService: MyInfoService

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMyInfoBinding.inflate(layoutInflater)

        val okHttpClient = OkHttpClient.Builder()
            .addInterceptor(LoginHandleInterceptor(applicationContext)).build()
        val retrofit = Retrofit.Builder()
            .baseUrl(getString(R.string.ip_num))
            .client(okHttpClient)
            .addConverterFactory(GsonConverterFactory.create())
            .build()

        myInfoService = retrofit.create(MyInfoService::class.java)

        // 내 정보 불러오기
        myInfoService.getMyInfo()
            .enqueue(object: Callback<MyInfo> {
                override fun onResponse(
                    call: Call<MyInfo>,
                    response: Response<MyInfo>
                ) {
                    if(response.isSuccessful.not()){
                        Log.e(ConstraintLayoutStates.TAG, "NOT!!! SUCCESS")
                        return;
                    }
                    Log.e(ConstraintLayoutStates.TAG, "성공!")
                    Log.e(ConstraintLayoutStates.TAG, "${response.body()}")
                    val myInfo: MyInfo? = response.body()
                    Log.e(ConstraintLayoutStates.TAG, "${myInfo?.memEmail}")
                    if(myInfo != null){
                        bind(myInfo!!)
                    } else {
                        Log.e(ConstraintLayoutStates.TAG, "null입니당")
                    }

                }

                override fun onFailure(call: Call<MyInfo>, t: Throwable) {
                    // 실패처리
                    Log.e(ConstraintLayoutStates.TAG, "실패...")
                    Log.e(ConstraintLayoutStates.TAG, t.toString())
                }
            })
        setContentView(binding.root)
    }
    fun bind(myInfoModel: MyInfo) {
        Log.e(ConstraintLayoutStates.TAG, "bind 호출 성공...")
        binding.memStarRatingBar.rating = myInfoModel.memStar.toFloat()
        binding.memEmailTextView.text = myInfoModel.memEmail
        binding.memNicknameTextView.text = myInfoModel.memNickname

        // 이미지 가져오기
        Glide
            .with(binding.memImgImageView.context)
            .load("http://115.91.81.108:9696/myPage/assets/img/profile/" + myInfoModel.memImg)
            .into(binding.memImgImageView)
    }
}