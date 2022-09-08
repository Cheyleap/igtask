import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ig_task/API/api_integration.dart';
import 'package:ig_task/Model/controller.dart';
import 'package:ig_task/Screen/home.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IntegrateAPI api=IntegrateAPI();
    return Scaffold(
      body: GetBuilder<Controller>(
        init: Controller(),
        builder: (controller) {
          return SafeArea(
            bottom: false,
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.maxFinite,
                  child: Image.asset('assets/login.png', fit: BoxFit.fill,),
                ),
                Container(
                  color: const Color(0xFFB8D2F9),
                  height: 679,
                  width: double.maxFinite,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: Text('Welcome!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 80),
                        child: Text('Login to continue',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text('${controller.error}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          controller: controller.name,
                          validator: (value) {
                            if (value == "") {
                              return "Please Fill Username";
                            } else if (value!.length < 6) {
                              return "Username is too short";
                            }
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Username',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 18
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 28, left: 20, right: 20),
                        child: TextFormField(
                          controller: controller.password,
                          validator: (value) {
                            if (value == "") {
                              return "Please Fill Passowrd";
                            } else if (value!.length < 8) {
                              return "Your password is too short";
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Passowrd',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 18
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20, top: 20),
                        child: ElevatedButton(
                          onPressed: (){
                            controller.onPress();
                          },
                          child: Text('Login', style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFDFB149),
                            fixedSize: Size(148, 52),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {

                            },
                            child: const Text('Forgot your password?',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],),);
        }
      ),
    );
  }
}
