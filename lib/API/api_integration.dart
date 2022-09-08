import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ig_task/Model/controller.dart';
import 'package:ig_task/Model/menu.dart';
import 'package:ig_task/Model/outlet.dart';
import 'package:ig_task/Model/user.dart';
import 'dart:convert';
class IntegrateAPI{
  Future<User?> getUser(String name) async{
    final response = await http.get(
      Uri.parse('http://127.0.0.1:5000/data/${name}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
  Future<List<Outlet>> getAllOutlets()async{
    final response = await http.get(
      Uri.parse('http://127.0.0.1:5000/outlet'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    var jsonData=jsonDecode(response.body);
    List<Outlet> outlets=[];
    for(var u in jsonData){
      Outlet outlet=Outlet(u['id'],u['name'],u['price'],u['size'],u['status']);
      outlets.add(outlet);
    }
    return outlets;
  }
  Future<List<MenuList>> getAllMenus()async{
    final response = await http.get(
      Uri.parse('http://127.0.0.1:5000/menu'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    var jsonData=jsonDecode(response.body);
    List<MenuList> menus=[];
    for(var u in jsonData){
      MenuList menu=MenuList(u['id'],u['name'],u['location'],u['outlet'],u['available']);
      menus.add(menu);
    }
    return menus;
  }
}
