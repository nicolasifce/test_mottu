package com.example.test_mottu
//import io.flutter.embedding.android.FlutterActivity

import android.os.Environment
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import java.io.File
import java.lang.reflect.Method
import java.util.*
import kotlin.collections.ArrayList


class MainActivity: FlutterActivity() {

    private val CHANNEL = "com.test_mottu.flutter/list";
    
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
     
    val list = arrayListOf<String>();
    val nameUser = String(); 
     MethodChannel(flutterEngine.dartExecutor.binaryMessenger,CHANNEL).setMethodCallHandler{
         call,result ->
         if(call.method == "getList"){
           result.success(list);
         }
         if(call.method == "setName"){
            val nameUser : String? = call.argument("name");
            if(nameUser!=null){
            list.add(nameUser);
            result.success("Adição feita com sucesso");
            }
         }

         if(call.method == "removeName"){
            val indexName:Int? = call.argument("index");
            if(indexName!=null){
            list.removeAt(indexName);
            result.success("Remoção feita com sucesso");
            }
         }

         if(call.method == "randomList"){
            val randomItem:String = list.random();
            result.success(randomItem);
         }

           if(call.method == "clearList"){
            list.clear();
            result.success("Lista Limpa");
         }
     }
     
}


    }

