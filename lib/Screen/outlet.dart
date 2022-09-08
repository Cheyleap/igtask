import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ig_task/Model/controller.dart';
class OutletList extends StatelessWidget {
  const OutletList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      init: Controller(),
      builder: (controller){
      return Scaffold(
        backgroundColor: Color(0xFFEEF0F2),
        appBar: AppBar(
          backgroundColor: Color(0xFF0F68EE),
          elevation: 0,
          title: Text(
            'Outlet List',
            style: TextStyle(
              fontSize: 23
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: Get.arguments.length,
          itemBuilder: _itemBuilder,
        ),
      );
    },
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 5,left: 12,right: 12),
      child: Container(
        height: 100,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 1,
            child: Center(
              child: ListTile(
                leading: Image.asset('assets/outlet.png',fit: BoxFit.fill,),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      Text(
                        "${Get.arguments[index].name}",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 80,),
                      SvgPicture.asset('assets/dollar.svg',height: 20,width: 20,),
                      const SizedBox(width: 10,),
                      Text("${Get.arguments[index].price} / Month",
                        style: TextStyle(
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                ),
                subtitle: Row(
                  children: [
                    SvgPicture.asset('assets/stop.svg',height: 20,width: 20,),
                    SizedBox(width: 5,),
                    Text(
                      "${Get.arguments[index].size}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(width: 60,),
                    SvgPicture.asset('assets/circle.svg',height: 20,width: 20,),
                    const SizedBox(width: 10,),
                    Text(Get.arguments[index].status==0?"Available":Get.arguments[index].status==2?"Renovation":"Rent",
                      style: TextStyle(
                        color: Get.arguments[index].status==1?Colors.red:Get.arguments[index].status==2?Colors.orange:Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
