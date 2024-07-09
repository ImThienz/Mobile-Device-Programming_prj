package com.example.manager.adapter;

import android.content.Context;
import android.content.Intent;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;
import com.example.manager.Interface.ItemClickListener;
import com.example.manager.R;
import com.example.manager.activity.ChiTietActivity;
import com.example.manager.model.EventBus.SuaXoaEvent;
import com.example.manager.model.SanPhamMoi;
import com.example.manager.utils.Utils;

import org.greenrobot.eventbus.EventBus;

import java.text.DecimalFormat;
import java.util.List;

public class SanPhamMoiAdapter extends RecyclerView.Adapter<SanPhamMoiAdapter.MyViewHolder> {
    private Context context;
    private List<SanPhamMoi> array;
    private int position;

    public SanPhamMoiAdapter(Context context, List<SanPhamMoi> array) {
        this.context = context;
        this.array = array;
    }

    public int getPosition() {
        return position;
    }

    @NonNull
    @Override
    public MyViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View item = LayoutInflater.from(parent.getContext()).inflate(R.layout.item_sp_moi, parent, false);
        return new MyViewHolder(item);
    }

    @Override
    public void onBindViewHolder(@NonNull MyViewHolder holder, int position) {
        SanPhamMoi sanPhamMoi = array.get(position);
        holder.txtten.setText(sanPhamMoi.getTensp());
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        holder.txtgia.setText("Giá: " + decimalFormat.format(Double.parseDouble(sanPhamMoi.getGiasp())) + "VNĐ");
        if (sanPhamMoi.getHinhanh().contains("http")) {
            Glide.with(context).load(sanPhamMoi.getHinhanh()).into(holder.imghinhanh);
        } else {
            String hinh = Utils.BASE_URL + "images/" + sanPhamMoi.getHinhanh();
            Glide.with(context).load(hinh).into(holder.imghinhanh);
        }

        holder.setItemClickListener((view, pos, isLongClick) -> {
            if (!isLongClick) {
                //click
                Intent intent = new Intent(context, ChiTietActivity.class);
                intent.putExtra("chitiet", sanPhamMoi);
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                context.startActivity(intent);
            } else {
                this.position = pos;
                EventBus.getDefault().postSticky(new SuaXoaEvent(sanPhamMoi));
                view.showContextMenu();  // Hiển thị context menu
            }
        });
    }

    @Override
    public int getItemCount() {
        return array.size();
    }

    public class MyViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener, View.OnCreateContextMenuListener, View.OnLongClickListener {
        TextView txtgia, txtten;
        ImageView imghinhanh;
        private ItemClickListener itemClickListener;

        public MyViewHolder(@NonNull View itemView) {
            super(itemView);
            txtgia = itemView.findViewById(R.id.itemsp_gia);
            txtten = itemView.findViewById(R.id.itemsp_ten);
            imghinhanh = itemView.findViewById(R.id.itemsp_image);
            itemView.setOnClickListener(this);
            itemView.setOnCreateContextMenuListener(this);
            itemView.setOnLongClickListener(this);
        }

        public void setItemClickListener(ItemClickListener itemClickListener) {
            this.itemClickListener = itemClickListener;
        }

        @Override
        public void onClick(View view) {
            itemClickListener.onClick(view, getBindingAdapterPosition(), false);
        }

        @Override
        public void onCreateContextMenu(ContextMenu menu, View v, ContextMenu.ContextMenuInfo menuInfo) {
            menu.add(0, 0, getBindingAdapterPosition(), "Sửa");
            menu.add(0, 1, getBindingAdapterPosition(), "Xóa");
        }

        @Override
        public boolean onLongClick(View v) {
            itemClickListener.onClick(v, getBindingAdapterPosition(), true);
            return true;
        }
    }
}
