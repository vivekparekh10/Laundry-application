import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SmartWash/MainScreen.dart';
import 'package:SmartWash/RegisterPage.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController email_id = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool _passwordvisible=false;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _loginfeild = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool pass = true;
  bool temp = false;
  TextEditingController email_id = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool _passwordvisible = false;


  void loginUser() async {
    print("1");
    var link = "https://capstonesw123.000webhostapp.com/php/login.php";
    var res = await http.post(
      Uri.parse(link),
      body: {
        "email": emailController.text,
        "upassword": passController.text,
      },
    );
    print(res.statusCode);
    print("2");

    // url to registration php script
    // var APIURL = "https://capstonesw123.000webhostapp.com/php/login.php";
    // //json maping user entered details
    //
    // Map mapeddate = {
    //   'email': email_id.text,
    //   'upassword': password.text,
    //
    // };
    // print("3");
    // //send  data using http post to our php code
    // http.Response response = await http.post(Uri.parse(APIURL), body: mapeddate);
    print("2");
    if (res.statusCode == 200) {
      var resBodyOflogin = jsonDecode(res.body);
      print(resBodyOflogin);
      if (resBodyOflogin["success"] == true) {
        print("done");
      } else {
        print("error");
      }
    } else {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(),
                gradient: LinearGradient(
                  colors: [Colors.white70, Colors.deepPurpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  stops: [0.3, 10],
                  tileMode: TileMode.repeated,
                ),
              )),
          SingleChildScrollView(
            child: Form(
              //form Change event for form field or not
              onChanged: () {
                if (_loginfeild.currentState!.validate() == true) {
                  setState(() {
                    temp = true;
                  });
                } else {
                  setState(() {
                    temp = false;
                  });
                }
              },
              key: _loginfeild,

              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 15,
                    top: MediaQuery.of(context).size.height / 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: const AssetImage('images/remove.png'),
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width / 1,
                    ),
                    const Text(
                      "Welcome, Login",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 9),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 120),
                      child: Row(
                        children: [
                          const Text("No Account?",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400)),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterPage(),
                                  ));
                            },
                            child: const Text(
                              "No Account?",
                              style: TextStyle(
                                  color: Colors.indigoAccent,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 22,
                          right: MediaQuery.of(context).size.width / 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  contentPadding: EdgeInsets.only(
                                      left:
                                      MediaQuery.of(context).size.width / 20),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(10.0)),
                                  hintText: "Email"),
                              autovalidateMode:
                              AutovalidateMode.onUserInteraction,

                              //Email Validator
                              validator: (value) {
                                final bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value!);
                                if (value!.isEmpty) {
                                  return "Enter Email";
                                } else if (!emailValid) {
                                  return "Enter Valid Email";
                                } else {
                                  return null;
                                }
                              }),

                          SizedBox(
                              height: MediaQuery.of(context).size.height / 45),

                          //Password TextField
                          TextFormField(
                            controller: passController,
                            obscureText: pass,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              contentPadding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width / 20),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.0)),
                              hintText: "Password",
                              suffix: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      pass = !pass;
                                    });
                                  },
                                  child: Icon(pass
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                              ),
                            ),

                            //Password Validator
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Password";
                              } else if (passController.text.length > 6) {
                                return "Password Length Should be more than 6 charcters";
                              }
                              else {
                                return null;
                              }
                            },
                          ),

                          SizedBox(
                              height: MediaQuery.of(context).size.height / 20),

                          //Elevated Button For Sign In
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                onSurface: Colors.lightBlue,
                                elevation: 0.1,
                                minimumSize: Size(
                                  MediaQuery.of(context).size.height / 7.0,
                                  MediaQuery.of(context).size.width / 7.0,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                              ),
                              onPressed: temp == true
                                  ? () {
                                loginUser();
                                print("ok");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>MainScreen()));
                              }
                                  : null,
                              child: const Text("Sign In ",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ))),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      );
    }
}