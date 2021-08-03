package com.example.android_nds

import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.constraintlayout.widget.ConstraintLayoutStates.TAG
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.android_nds.adapter.TradeSellAdapter
import com.example.android_nds.databinding.FragmentMyTradeSellBinding
import com.example.android_nds.interceptor.LoginHandleInterceptor
import com.example.android_nds.model.TradeSell
import com.example.android_nds.api.TradeSellService
import okhttp3.OkHttpClient
import retrofit2.*
import retrofit2.converter.gson.GsonConverterFactory

class MyTradeSellFragment : Fragment(R.layout.fragment_my_trade_sell) {
    private lateinit var binding: FragmentMyTradeSellBinding
    private lateinit var adapter: TradeSellAdapter
    private lateinit var tradeSellService: TradeSellService

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        super.onCreate(savedInstanceState)
        binding = FragmentMyTradeSellBinding.inflate(layoutInflater)

        adapter = TradeSellAdapter()
        binding.tradeSellRecyclerView.layoutManager = LinearLayoutManager(context)
        binding.tradeSellRecyclerView.adapter = adapter


        val okHttpClient = OkHttpClient.Builder()
            .addInterceptor(context?.let { LoginHandleInterceptor(it) }).build()
        val retrofit = Retrofit.Builder()
            .baseUrl(getString(R.string.ip_num))
            .client(okHttpClient)
            .addConverterFactory(GsonConverterFactory.create())
            .build()

        tradeSellService = retrofit.create(TradeSellService::class.java)

        val view = binding.root

        // 판매내역 불러오기
        tradeSellService.getTradeSell("sel")
            .enqueue(object: Callback<List<TradeSell>>{
                override fun onResponse(
                    call: Call<List<TradeSell>>,
                    response: Response<List<TradeSell>>
                ) {
                    if(response.isSuccessful.not()){
                        Log.e(TAG, "NOT!!! SUCCESS")
                        return;
                    }
                    Log.e(TAG, "성공!")
                    Log.e(TAG, "${response.body()}")
                    adapter.submitList(response.body()?.orEmpty())
                    binding.tradeSellTextView.text = response.body()?.size.toString()
                }

                override fun onFailure(call: Call<List<TradeSell>>, t: Throwable) {
                    // 실패처리
                    Log.e(TAG, "실패...")
                    Log.e(TAG, t.toString())
                }
            })

        return view
    }
}