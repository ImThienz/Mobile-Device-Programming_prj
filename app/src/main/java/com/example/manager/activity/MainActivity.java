package com.example.manager.activity;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Bundle;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.AdapterView;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.Toast;
import android.widget.ViewFlipper;

import com.bumptech.glide.Glide;
import com.example.manager.R;
import com.example.manager.adapter.LoaiSpAdapter;
import com.example.manager.adapter.SanPhamMoiAdapter;
import com.example.manager.model.LoaiSp;
import com.example.manager.model.SanPhamMoi;
import com.example.manager.retrofit.ApiBanHang;
import com.example.manager.retrofit.RetrofitClient;
import com.example.manager.utils.Utils;
import com.google.android.material.navigation.NavigationView;
import com.nex3z.notificationbadge.NotificationBadge;

import java.util.ArrayList;
import java.util.List;

import io.paperdb.Paper;
import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.schedulers.Schedulers;



public class MainActivity extends AppCompatActivity {
    Toolbar toolbar;
    ViewFlipper viewFlipper;
    RecyclerView recyclerViewManHinhChinh;
    NavigationView navigationView;
    ListView listViewManHinhChinh;
    DrawerLayout drawerLayout;
    LoaiSpAdapter loaiSpAdapter;
    List<LoaiSp> mangloaisp;
    CompositeDisposable compositeDisposable = new CompositeDisposable();
    ApiBanHang apiBanHang;
    List<SanPhamMoi> mangSpMoi;
    SanPhamMoiAdapter spAdapter;
    NotificationBadge badge;
    FrameLayout frameLayout;
    ImageView imgsearch;








    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        apiBanHang = RetrofitClient.getInstance(Utils.BASE_URL).create(ApiBanHang.class);


        Anhxa();
        Actionbar();
        ActionViewFlipper();
        getSpMoi();
        getEventClick();
        if (isConnected(this)){
            ActionViewFlipper();
            getLoaiSanPham();
        }else{
            Toast.makeText(getApplicationContext(),"Không kết nối mạng được",Toast.LENGTH_LONG).show();
        }




    }

    private void getEventClick() {
        listViewManHinhChinh.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                switch (i){
                    case 0:
                        Intent trangchu = new Intent(getApplicationContext(), MainActivity.class);
                        startActivity(trangchu);
                        break;
                    case 1:
                        Intent isekai = new Intent(getApplicationContext(),TruyenIsekai.class);
                        isekai.putExtra("title", "Truyện Isekai");
                        isekai.putExtra("loai",1);
                        startActivity(isekai);
                        break;
                    case 2:
                        Intent action = new Intent(getApplicationContext(),TruyenIsekai.class);
                        action.putExtra("title", "Truyện Action");
                        action.putExtra("loai",2);
                        startActivity(action);
                        break;
                    case 3:
                        Intent romcom = new Intent(getApplicationContext(),TruyenIsekai.class);
                        romcom.putExtra("title", "Truyện Romcom");
                        romcom.putExtra("loai",3);
                        startActivity(romcom);
                        break;
                    case 4:
                        Intent shounen = new Intent(getApplicationContext(),TruyenIsekai.class);
                        shounen.putExtra("title", "Truyện Shounen");
                        shounen.putExtra("loai",4);
                        startActivity(shounen);
                        break;
                    case 5:
                        Intent donhang = new Intent(getApplicationContext(),XemDonActivity.class);
                        startActivity(donhang);
                        break;
                    case 6:
                        Intent lienhe = new Intent(getApplicationContext(), LienHeActivity.class);
                        startActivity(lienhe);
                        break;
                    case 7 :
                        Intent quanli = new Intent(getApplicationContext(), QuanLiActivity.class);
                        startActivity(quanli);
                        break;
                    case 8:
                        Paper.book().delete("user");
                        Intent dangnhap= new Intent(getApplicationContext(), DangNhapActivity.class);
                        startActivity(dangnhap);
                        finish();
                        break;



                }


            }
        });
    }

    private void getSpMoi() {
        compositeDisposable.add(apiBanHang.getSpMoi()
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                        sanPhamMoiModel -> {
                            //Lấy hết sp
                        /*  if (sanPhamMoiModel.isSuccess()){
                            mangSpMoi = sanPhamMoiModel.getResult();
                            spAdapter = new SanPhamMoiAdapter(getApplicationContext(),mangSpMoi);
                            recyclerViewManHinhChinh.setAdapter(spAdapter);

                        }   */

                            //Lấy giới hạn sp
                            if (sanPhamMoiModel.isSuccess()){
                                // Giới hạn số lượng sản phẩm hiển thị
                                List<SanPhamMoi> limitedSpMoi = sanPhamMoiModel.getResult();
                                int limit = 30;
                                if (limitedSpMoi.size() > limit) {
                                    limitedSpMoi = limitedSpMoi.subList(0, limit);
                                }
                                mangSpMoi = limitedSpMoi;
                                spAdapter = new SanPhamMoiAdapter(getApplicationContext(), mangSpMoi);
                                recyclerViewManHinhChinh.setAdapter(spAdapter);
                            }


                        },
                        throwable -> {
                            Toast.makeText(getApplicationContext(),"Không kết nối được với server"+throwable.getMessage(),Toast.LENGTH_LONG).show();
                        }
                ));
    }

    private void getLoaiSanPham() {
        compositeDisposable.add(apiBanHang.getLoaiSp()
                .subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread())
                .subscribe(
                        loaiSpModel -> {
                            if (loaiSpModel.isSuccess()){
                                mangloaisp = loaiSpModel.getResult();
                                mangloaisp.add(new LoaiSp("Liên Hệ", "https://github.com/ImThienz/truyentranhN8/blob/main/truyentranh/contact.png?raw=true"));
                                mangloaisp.add(new LoaiSp("Quản Lí", "https://github.com/ImThienz/truyentranhN8/blob/main/truyentranh/admin.png?raw=true"));
                                mangloaisp.add(new LoaiSp("Đăng Xuất", "https://github.com/ImThienz/truyentranhN8/blob/main/truyentranh/logout.png?raw=true"));
                                loaiSpAdapter = new LoaiSpAdapter(getApplicationContext(),mangloaisp);
                                listViewManHinhChinh.setAdapter(loaiSpAdapter);
                            }
                        }
                ));

    }

    private void ActionViewFlipper() {
        List<String> mangquangcao = new ArrayList<>();
        mangquangcao.add("https://herogame.vn/ad-min/assets/js/libs/kcfinder/upload_image/images/Vi%E1%BB%87t/Herogame_MTGPV2QOM_01.jpg");
        mangquangcao.add("https://www.ft.com/__origami/service/image/v2/images/raw/https%3A%2F%2Fcms-image-bucket-production-ap-northeast-1-a7d2.s3.ap-northeast-1.amazonaws.com%2Fimages%2F8%2F2%2F1%2F9%2F47569128-1-eng-GB%2Fconan+main.jpg?width=1260&height=630&fit=cover&gravity=faces&source=nar-cms");
        mangquangcao.add("https://www.crunchyroll.com/imgsrv/display/thumbnail/1200x675/catalog/crunchyroll/3e426b92e0f4d9d1fff29cad8e268773.jpe");
        mangquangcao.add("https://ichef.bbci.co.uk/images/ic/624x351/p0chs3zk.jpg");
        mangquangcao.add("https://static.wikia.nocookie.net/jujutsu-kaisen/images/e/e0/Jujutsu_Kaisen_Cursed_Clash_Key_Visual.png");
        for (int i = 0; i<mangquangcao.size(); i++){
            ImageView imageView = new ImageView(getApplicationContext());
            Glide.with(getApplicationContext()).load(mangquangcao.get(i)).into(imageView);
            imageView.setScaleType(ImageView.ScaleType.FIT_XY);
            viewFlipper.addView(imageView);

        }
        viewFlipper.setFlipInterval(3000);
        viewFlipper.setAutoStart(true);
        Animation slide_in = AnimationUtils.loadAnimation(getApplicationContext(),R.anim.slide_in_right);
        Animation slide_out = AnimationUtils.loadAnimation(getApplicationContext(),R.anim.slide_out_right);
        viewFlipper.setInAnimation(slide_in);
        viewFlipper.setOutAnimation(slide_out);


    }

    private void Actionbar() {
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        toolbar.setNavigationIcon(android.R.drawable.ic_menu_sort_by_size);
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                drawerLayout.openDrawer(GravityCompat.START);
            }
        });
    }

    private void Anhxa() {
        imgsearch = findViewById(R.id.imgsearch);
        toolbar = findViewById(R.id.toolbarmanhinhchinh);
        viewFlipper = findViewById(R.id.viewflipper);
        recyclerViewManHinhChinh = findViewById(R.id.recycleview);
        RecyclerView.LayoutManager layoutManager = new GridLayoutManager(this,2);
        recyclerViewManHinhChinh.setLayoutManager(layoutManager);
        recyclerViewManHinhChinh.setHasFixedSize(true);
        navigationView = findViewById(R.id.navigationview);
        listViewManHinhChinh = findViewById(R.id.listviewmanhinhchinh);
        drawerLayout = findViewById(R.id.drawerlayout);
        badge = findViewById(R.id.menu_sl);
        frameLayout = findViewById(R.id.framegiohang);
        //khoi tao list
        mangloaisp = new ArrayList<>();
        mangSpMoi = new ArrayList<>();
        if (Utils.manggiohang ==null){
            Utils.manggiohang = new ArrayList<>();
        }else {
            int totalItem = 0;
            for (int i = 0; i<Utils.manggiohang.size();i++) {
                totalItem = totalItem + Utils.manggiohang.get(i).getSoluong();
            }
            badge.setText(String.valueOf(totalItem));
        }
        frameLayout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent giohang = new Intent(getApplicationContext(), GioHangActivity.class);
                startActivity(giohang);
            }
        });

        imgsearch.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), SearchActivity.class);
                startActivity(intent);
            }
        });


    }

    @Override
    protected void onResume() {
        super.onResume();
        int totalItem = 0;
        for (int i = 0; i<Utils.manggiohang.size();i++) {
            totalItem = totalItem + Utils.manggiohang.get(i).getSoluong();
        }
        badge.setText(String.valueOf(totalItem));
    }

    private boolean isConnected (Context context){
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo wifi = connectivityManager.getNetworkInfo(ConnectivityManager.TYPE_WIFI);  //them quyen truy cap internet
        NetworkInfo mobile = connectivityManager.getNetworkInfo(ConnectivityManager.TYPE_MOBILE);
        if (wifi != null && wifi.isConnected() || (mobile != null && mobile.isConnected())){
            return true;
        }else {
            return false;
        }

    }

    @Override
    protected void onDestroy() {
        compositeDisposable.clear();
        super.onDestroy();
    }
}
