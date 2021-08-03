package com.example.android_nds

import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.constraintlayout.widget.ConstraintLayoutStates.TAG
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.android_nds.databinding.FragmentMyErrandResBinding
import com.example.android_nds.interceptor.LoginHandleInterceptor
import com.example.android_nds.model.ErrandRes
import com.example.android_nds.api.ErrandResService
import okhttp3.OkHttpClient
import retrofit2.*
import retrofit2.converter.gson.GsonConverterFactory

class MyErrandResFragment : Fragment(R.layout.fragment_my_errand_res) {
    private lateinit var binding: FragmentMyErrandResBinding
    private lateinit var adapter: ErrandResAdapter
    private lateinit var errandResService: ErrandResService

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        super.onCreate(savedInstanceState)
        binding = FragmentMyErrandResBinding.inflate(layoutInflater)

        adapter = ErrandResAdapter()
        binding.errandResRecyclerView.layoutManager = LinearLayoutManager(context)
        binding.errandResRecyclerView.adapter = adapter

        val okHttpClient = OkHttpClient.Builder()
            .addInterceptor(context?.let { LoginHandleInterceptor(it) }).build()
        val retrofit = Retrofit.Builder()
            .baseUrl(getString(R.string.ip_num))
            .client(okHttpClient)
            .addConverterFactory(GsonConverterFactory.create())
            .build()

        errandResService = retrofit.create(ErrandResService::class.java)

        val view = binding.root

        // 내가 수행한 심부름 목록 불러오기
        errandResService.getErrandRes("nds")
            .enqueue(object: Callback<List<ErrandRes>>{
                override fun onResponse(
                    call: Call<List<ErrandRes>>,
                    response: Response<List<ErrandRes>>
                ) {
                    if(response.isSuccessful.not()){
                        Log.e(TAG, "NOT!!! SUCCESS")
                        return;
                    }
                    Log.e(TAG, "성공!")
                    Log.e(TAG, "${response.body()}")
                    adapter.submitList(response.body()?.orEmpty())
                    binding.errandResTextView.text = response.body()?.size.toString()
                }

                override fun onFailure(call: Call<List<ErrandRes>>, t: Throwable) {
                    // 실패처리
                    Log.e(TAG, "실패...")
                    Log.e(TAG, t.toString())
                }
            })

        return view
    }
}