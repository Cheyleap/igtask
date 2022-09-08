import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ig_task/Screen/home.dart';
import 'package:ig_task/Screen/home_page.dart';
import 'package:ig_task/Screen/login.dart';
import 'package:ig_task/Screen/outlet.dart';

class RouteClass{
  static List<GetPage> routes=[
    GetPage(name: '/login', page: ()=>LoginScreen()),
    GetPage(name: '/outlet', page: ()=>OutletList()),
    GetPage(name: '/home', page: ()=>HomePage()),
    GetPage(name: '/', page: ()=>GetStarted()),
  ];
}