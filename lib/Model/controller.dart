import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ig_task/API/api_integration.dart';

class Controller extends GetxController{
  TextEditingController name=TextEditingController();
  TextEditingController password=TextEditingController();
  var error='';
  var outlets=[];
  var menus=[];
  IntegrateAPI api=IntegrateAPI();

  onFetchMenus()async{
    menus=await api.getAllMenus();
    update();
  }

  onPress()async{
    var obj=await api.getUser(name.text);
    if(name.text==obj?.name){
      if(password.text==obj?.password){
        onFetchMenus();
        Get.toNamed('/home',arguments: name.text);
      }else{
        error='Invalid username or password';
      }
    }else{
      error='Invalid username or password';
    }
    update();
  }

  onClick()async{
    outlets=await api.getAllOutlets();
    Get.offAndToNamed('/outlet',arguments: outlets);
    update();
  }
}