import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:ig_task/Screen/login.dart';
class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
          body: SafeArea(
            bottom: false,
            child: Stack(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    child: Image.asset('assets/background.png',fit: BoxFit.fill,)),
                  Positioned(
                    top: 60,
                    left: 160,
                    child: Image.asset('assets/logo.png'),
                  ),
                  const Positioned(
                    top: 170,
                    left: 135,
                      child: Text('KPS Property',
                        style: TextStyle(
                          fontSize: 23,
                          fontFamily: 'SFUIText',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ),
                  const Positioned(
                    top: 200,
                      left: 100,
                      child: Text('Collect money by one click',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'SFUIText-Regular',
                          color: Colors.white
                        ),
                      ),
                  ),
                  Positioned(
                    top: 700,
                      left: 70,
                      child: ElevatedButton(
                        child:Text('Get Started',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                          ),
                        ),
                        onPressed: (){
                          var name="Guest";
                          Get.offAndToNamed('/home',arguments: name);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          fixedSize: Size(300, 38),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                  ),
                  Positioned(
                    top: 760,
                    left: 85,
                    child: Row(
                      children: [
                        const Text('Already have account?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'SFUIText',
                            fontWeight: FontWeight.bold
                          ),),
                        const SizedBox(width: 10,),
                        GestureDetector(
                          onTap: (){
                            Get.offAndToNamed('/login');
                          },
                          child: const Text('Login',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ),
      ),
    );
  }
}
