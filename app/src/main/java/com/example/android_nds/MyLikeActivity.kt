package com.example.android_nds

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.constraintlayout.widget.ConstraintLayoutStates.TAG
import com.example.android_nds.adapter.MyLikeAdapter
import com.example.android_nds.databinding.ActivityMyLikeBinding
import com.example.android_nds.interceptor.LoginHandleInterceptor
import com.example.android_nds.model.Mylike
import com.example.android_nds.api.MyLikeService
import okhttp3.OkHttpClient
import retrofit2.*
import retrofit2.converter.gson.GsonConverterFactory

class MyLikeActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMyLikeBinding
    private lateinit var adapter: MyLikeAdapter
    private lateinit var myLikeService: MyLikeService

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)


        val okHttpClient = OkHttpClient.Builder()
            .addInterceptor(LoginHandleInterceptor(applicationContext)).build()
        val retrofit = Retrofit.Builder()
            .baseUrl(getString(R.string.ip_num))
            .client(okHttpClient)
            .addConverterFactory(GsonConverterFactory.create())
            .build()

        myLikeService = retrofit.create(MyLikeService::class.java)

        binding = ActivityMyLikeBinding.inflate(layoutInflater)
        setContentView(binding.root)

        adapter = MyLikeAdapter(itemClickListener = {
            val intent = Intent(this, ItemDetailActivity::class.java)
            Log.i(TAG, "클릭한 게시글의 번호: ${it.bmNo}")
            intent.putExtra("bm_no",it.bmNo)
            startActivity(intent)
        })
        binding.myLikeRecyclerView.layoutManager = LinearLayoutManager(this)
        binding.myLikeRecyclerView.adapter = adapter


        // 내 찜 목록 불러오기
        myLikeService.getMyLike()
            .enqueue(object: Callback<List<Mylike>>{
                override fun onResponse(
                    call: Call<List<Mylike>>,
                    response: Response<List<Mylike>>
                ) {
                    if(response.isSuccessful.not()){
                        Log.e(TAG, "NOT!!! SUCCESS")
                        return;
                    }
                    Log.e(TAG, "성공!")
                    Log.e(TAG, "${response.body()}")
                    adapter.submitList(response.body()?.orEmpty())
                    binding.likeTextView.text = response.body()?.size.toString()
                }

                override fun onFailure(call: Call<List<Mylike>>, t: Throwable) {
                    // 실패처리
                    Log.e(TAG, "실패...")
                    Log.e(TAG, t.toString())
                }
            })
    }
}