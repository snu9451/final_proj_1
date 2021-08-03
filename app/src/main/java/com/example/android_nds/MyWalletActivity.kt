package com.example.android_nds

import android.os.Bundle
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import androidx.constraintlayout.widget.ConstraintLayoutStates.TAG
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.android_nds.adapter.WalletAdapter
import com.example.android_nds.databinding.ActivityMyWalletBinding
import com.example.android_nds.interceptor.LoginHandleInterceptor
import com.example.android_nds.model.CoinTrans
import com.example.android_nds.api.CoinTransService
import okhttp3.OkHttpClient
import retrofit2.*
import retrofit2.converter.gson.GsonConverterFactory

class MyWalletActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMyWalletBinding
    private lateinit var adapter: WalletAdapter
    private lateinit var coinTransService: CoinTransService
    private lateinit var coinRemain: String

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMyWalletBinding.inflate(layoutInflater)
        setContentView(binding.root)

        adapter = WalletAdapter()
        binding.coinTransRecyclerView.layoutManager = LinearLayoutManager(this)
        binding.coinTransRecyclerView.adapter = adapter

        val okHttpClient = OkHttpClient.Builder()
            .addInterceptor(LoginHandleInterceptor(applicationContext)).build()
        val retrofit = Retrofit.Builder()
            .baseUrl(getString(R.string.ip_num))
            .client(okHttpClient)
            .addConverterFactory(GsonConverterFactory.create())
            .build()

        coinTransService = retrofit.create(CoinTransService::class.java)
         
        // 내 지갑 보기 불러오기
        coinTransService.getcoinTrans()
            .enqueue(object: Callback<List<CoinTrans>> {
                override fun onResponse(
                    call: Call<List<CoinTrans>>,
                    response: Response<List<CoinTrans>>
                ) {
                    if(response.isSuccessful.not()) {
                        Log.e(TAG, "NOT!!! SUCCESS")
                        return;
                    }
                    Log.e(TAG, "성공!")
                    Log.e(TAG, "${response.body()}")
                    adapter.submitList(response.body()?.orEmpty())
                    coinRemain = response.body()?.get(0)?.transRemain.toString()
                    binding.getCoinTextView.text = coinRemain
                }

                override fun onFailure(call: Call<List<CoinTrans>>, t: Throwable) {
                    // 실패처리
                    Log.e(TAG, "실패...")
                    Log.e(TAG, t.toString())
                }
            })
    }
}