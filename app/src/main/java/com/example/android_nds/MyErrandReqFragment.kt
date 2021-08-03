package com.example.android_nds

import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.constraintlayout.widget.ConstraintLayoutStates.TAG
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.android_nds.adapter.ErrandReqAdapter
import com.example.android_nds.databinding.FragmentMyErrandReqBinding
import com.example.android_nds.interceptor.LoginHandleInterceptor
import com.example.android_nds.model.ErrandReq
import com.example.android_nds.api.ErrandReqService
import okhttp3.OkHttpClient
import retrofit2.*
import retrofit2.converter.gson.GsonConverterFactory

class MyErrandReqFragment : Fragment(R.layout.fragment_my_errand_req) {
    private lateinit var binding: FragmentMyErrandReqBinding
    private lateinit var adapter: ErrandReqAdapter
    private lateinit var errandReqService: ErrandReqService

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        super.onCreate(savedInstanceState)
        binding = FragmentMyErrandReqBinding.inflate(layoutInflater)

        adapter = ErrandReqAdapter()
        binding.errandReqRecyclerView.layoutManager = LinearLayoutManager(context)
        binding.errandReqRecyclerView.adapter = adapter

        val okHttpClient = OkHttpClient.Builder()
            .addInterceptor(context?.let { LoginHandleInterceptor(it) }).build()
        val retrofit = Retrofit.Builder()
            .baseUrl(getString(R.string.ip_num))
            .client(okHttpClient)
            .addConverterFactory(GsonConverterFactory.create())
            .build()

        errandReqService = retrofit.create(ErrandReqService::class.java)

        val view = binding.root

        // 내가 요청한 심부름 목록 불러오기
        errandReqService.getErrandReq( "req")
            .enqueue(object: Callback<List<ErrandReq>>{
                override fun onResponse(
                    call: Call<List<ErrandReq>>,
                    response: Response<List<ErrandReq>>
                ) {
                    if(response.isSuccessful.not()){
                        Log.e(TAG, "NOT!!! SUCCESS")
                        return;
                    }
                    Log.e(TAG, "성공!")
                    Log.e(TAG, "${response.body()}")
                    adapter.submitList(response.body()?.orEmpty())
                    binding.errandReqTextView.text = response.body()?.size.toString()
                }

                override fun onFailure(call: Call<List<ErrandReq>>, t: Throwable) {
                    // 실패처리
                    Log.e(TAG, "실패...")
                    Log.e(TAG, t.toString())
                }
            })

        return view
    }
}