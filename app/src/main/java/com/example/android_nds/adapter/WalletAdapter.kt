package com.example.android_nds.adapter

import android.graphics.Color
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.example.android_nds.databinding.CoinBinding
import com.example.android_nds.model.CoinTrans

class WalletAdapter: ListAdapter<CoinTrans, WalletAdapter.CoinViewHolder>(diffUtil) {
    inner class CoinViewHolder(private val binding: CoinBinding): RecyclerView.ViewHolder(binding.root) {
        fun bind(coinModel: CoinTrans) {
            binding.transDateTextView.text = coinModel.transDate
            binding.transContentTextView.text = coinModel.transContent
            binding.transPriceTextView.text = coinModel.transPrice
            binding.transRemainTextView.text = coinModel.transRemain
            binding.transIoTextView.text = coinModel.transIo

            if(coinModel.transIo == "입금") {
                binding.transIoTextView.setTextColor(Color.parseColor("#FF0000"))
            }
            else {
                binding.transIoTextView.setTextColor(Color.parseColor("#0000FF"))
            }
        }
    }

    // 미리 만들어진 뷰홀더 없을때 실행
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CoinViewHolder {
        return CoinViewHolder(CoinBinding.inflate(LayoutInflater.from(parent.context),parent,false))
    }

    // 뷰홀더가 바인딩 되었을 때 실제 데이터 그려주기
    override fun onBindViewHolder(holder: CoinViewHolder, position: Int) {
        holder.bind(currentList[position])
    }

    companion object {
        val diffUtil = object: DiffUtil.ItemCallback<CoinTrans>(){
            // 아이템이 같은지 체크
            override fun areItemsTheSame(oldItem: CoinTrans, newItem: CoinTrans): Boolean {
                return oldItem == newItem
            }

            // 내용이 같은지 체크
            override fun areContentsTheSame(oldItem: CoinTrans, newItem: CoinTrans): Boolean {
                return oldItem.transDate == newItem.transDate
            }
        }
    }
}