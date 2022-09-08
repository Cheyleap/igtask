import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../Model/controller.dart';
class HomePage extends StatelessWidget {
  var menus=[];
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var name=Get.arguments;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        color: Colors.white,
        child: SafeArea(
          bottom: false,
          child: GetBuilder<Controller>(
              init: Controller(),
              builder: (controller) {
                menus=controller.menus;
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Color(0xFF0F68EE),
                    elevation: 0,
                    centerTitle: true,
                    title: const Text('Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  drawer: Drawer(
                    child: ListView(
                      children: [
                        DrawerHeader(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Image.asset('assets/user.png',width: 70,height: 70,),
                                  SizedBox(width: 20,),
                                  Text(
                                    '${name}',
                                    style: TextStyle(
                                      fontSize: 18
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        menuItems(Icons.home_outlined,"Home",(){}),
                        ExpansionTile(
                          textColor: Colors.black,
                          iconColor: Colors.black,
                            children: [
                              ListTile(
                                onTap: (){
                                  controller.onClick();
                                  controller.update();
                                },
                                leading: const Text(''),
                                title: Text('Outlet',
                                  style: TextStyle(
                                  color: Colors.black
                                  ),
                                ),
                              ),
                              ListTile(
                                onTap: (){
                                  controller.onClick();
                                  Get.offAndToNamed('/outlet');
                                },
                                leading: const Text(''),
                                title: Text('Outlet Payment',
                                  style: TextStyle(
                                  color: Colors.black
                                  ),
                                ),
                              ),
                            ],
                            leading: Icon(Icons.note_add_outlined),
                            title: Text('Report',
                          ),
                        ),
                        menuItems(Icons.settings,"Setting",(){}),
                      ],
                    ),
                  ),
                  backgroundColor: Color(0xFFEEF0F2),
                  body: Container(
                    margin: EdgeInsets.only(top: 30),
                    child: ListView.builder(
                      itemCount: menus.length,
                        itemBuilder: _itemBuilder,
                    ),
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
  Widget menuItems(IconData? icon,String name, Function? function, {Widget? trail}){
    return ListTile(
      leading: Icon(icon),
      title: Text(name,),
      onTap: (){function;},
      trailing: trail
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: (){
          print(menus[index].name);
        },
        child: Container(
          height: 160,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 120,
                    child: Image.asset('assets/home.png',fit: BoxFit.fill,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${menus[index].name}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Image.asset('assets/place.png',width: 20,height: 20,),
                              SizedBox(width: 10,),
                              Text(
                                '${menus[index].location}',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Image.asset('assets/store.png',width: 20,height: 20,),
                              SizedBox(width: 10,),
                              Text(
                                'Outlet',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(width: 20,),
                              Text(
                                '${menus[index].outlet}',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Image.asset('assets/accept.png',width: 20,height: 20,),
                              SizedBox(width: 10,),
                              Text(
                                'Available',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(width: 20,),
                              Text(
                                '${menus[index].available}',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
