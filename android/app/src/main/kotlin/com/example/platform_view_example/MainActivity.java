package com.example.platform_view_example;

import android.os.Handler;
import android.view.View;
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.android.FlutterView;
import io.flutter.embedding.engine.FlutterEngine;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;

public class MainActivity extends FlutterActivity {
  FlutterView containerView;
  ScheduledExecutorService scheduledExecutorService =  Executors.newScheduledThreadPool(1);
  boolean need = true;
  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    super.configureFlutterEngine(flutterEngine);
    io.flutter.Log.setLogLevel(0);
    flutterEngine
        .getPlatformViewsController()
        .getRegistry()
        .registerViewFactory("<platform-view-type>", new NativeViewFactory());
  }
  Handler handler=new Handler();
  //Runnable runnable=new Runnable() {
  //  @Override
  //  public void run() {
  //    // TODO Auto-generated method stub
  //    Log.e("DJD"," scheduleAtFixedRate 执行了 当前"+ need+" 转换为 ImageView");
  //    if (need){
  //      need = false;
  //      containerView.renderToImageView();
  //    }else{
  //      need = true;
  //      containerView.backToSurface();
  //
  //    }
  //    handler.postDelayed(this, 10000);//表示第一次运行时的时间延迟
  //  }
  //};
  public void setContentView(View view) {
    super.setContentView(view);
    containerView = (FlutterView) view;

    //handler.postDelayed(runnable, 10000);//每两秒执行一次runnable.

  }
}