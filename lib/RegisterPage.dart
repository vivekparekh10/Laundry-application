import 'dart:convert';
import 'package:SmartWash/HomePage.dart';
import 'package:SmartWash/loginpage.dart';
import 'package:http/http.dart'as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SmartWash/MainScreen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);


  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final nameController = TextEditingController();
  final emaiController = TextEditingController();
  final passController = TextEditingController();
  final confpassController = TextEditingController();
  TextEditingController full_name= new TextEditingController();
  TextEditingController email= new TextEditingController();
  TextEditingController upassword= new TextEditingController();
  TextEditingController confirm_password= new TextEditingController();
  TextEditingController adddress= new TextEditingController();
  final uaddressController=TextEditingController();

  final _registerfeild = GlobalKey<FormState>();
  bool pass = true;
  bool confpass = true;
  bool temp = false;
insertrecord() {}


  Future register()  async {
    // url to registration php script
    var APIURL = "https://capstonesw123.000webhostapp.com/php/login_details.php";
    //json maping user entered details

    Map mapeddate = {
      'full_name': full_name.text,
      'email': email.text,
      'uaddress':uaddressController.text,
      'upassword': upassword.text,
      'confirm_password': confirm_password.text,

    };
    //send  data using http post to our php code
    http.Response response = await http.post(Uri.parse(APIURL), body: mapeddate);

    //getting response from php code, here

    var data = jsonDecode(response.body);
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
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.3, 10],
          tileMode: TileMode.repeated,
        ),
      )),
      SingleChildScrollView(
        child: Form(
          //form Change event for form field or not
          onChanged: () {
            if (_registerfeild.currentState?.validate() == true) {
              setState(() {
                temp = true;
              });
            } else {
              setState(() {
                temp = false;
              });
            }
          },
          key: _registerfeild,

          child: Column(children: [
            //Image
            Image(
              image: const AssetImage('images/remove.png'),
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height / 2.3,
              width: MediaQuery.of(context).size.width / 1,
            ),

            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 15,
                  top: MediaQuery.of(context).size.height / 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Text
                  const Text(
                    "Sign Up to Smart Wash",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),

                  const SizedBox(height: 7),

                  // Text for already have account
                  Row(children: [
                    const Text("Already have an account?",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey)),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.indigoAccent,
                            fontWeight: FontWeight.w500,
                            fontSize: 11),
                      ),
                    )
                  ]),

                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 22,
                        right: MediaQuery.of(context).size.width / 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //color for TextField
                        Theme(
                            data: ThemeData(
                                highlightColor: Colors.grey,
                                inputDecorationTheme:
                                    const InputDecorationTheme(
                                        fillColor: Colors.grey)),

                            //Name TextField
                            child: TextFormField(
                                controller: full_name,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    contentPadding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                20),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    hintText: " Full Name"),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Full Name";
                                  }
                                  return null;
                                }),
                                ),


                        SizedBox(
                            height: MediaQuery.of(context).size.height / 45),

                        //Email TextField
                        TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: email,
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

                            //Validation for empty or not
                            validator: (value) {
                              final bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value!);
                              if (value.isEmpty) {
                                return "Enter Email";
                              } else if (!emailValid) {
                                return "Enter Valid Email";
                              }
                            }),

                        SizedBox(
                            height: MediaQuery.of(context).size.height / 45),

                        //Password TextField
                        TextFormField(
                            controller: upassword,
                            obscureText: pass,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                contentPadding: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width / 20),
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
                                )),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter Password";
                              } else if (passController.text.length > 6) {
                                return "Password Length Should be more than 6 charcters";
                              }
                            }),

                        SizedBox(
                            height: MediaQuery.of(context).size.height / 45),

                        //Confirm Password
                        TextFormField(  
                            controller: confirm_password,
                            obscureText: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              contentPadding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width / 20),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10.0)),
                              hintText: "Confirm Password",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Confirm Password";
                              } else if (confpassController.text.length < 6) {
                                return "Confirm Password Length Should be more than 6 charcters";
                              } else if (passController.text !=
                                  confpassController.text) {
                                return "Not Match";
                              }
                              return null;
                            }),


                        SizedBox(
                            height: MediaQuery.of(context).size.height / 45),
                        TextFormField(
                            controller: uaddressController,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                contentPadding: EdgeInsets.only(
                                    left:
                                    MediaQuery.of(context).size.width /
                                        20),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                    BorderRadius.circular(10.0)),
                                hintText: " Address"),
                           validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Address";
                              }
                              return null;
                            }),

                        SizedBox(
                            height: MediaQuery.of(context).size.height / 45),

                        //Elevated Button for Creating Account
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlue,
                                elevation: 0.1,
                                minimumSize: Size(
                                    MediaQuery.of(context).size.height / 7.2,
                                    MediaQuery.of(context).size.width / 7.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                            onPressed: temp == true
                                ? () { register();
                              insertrecord();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MainScreen(),
                                        ));
                                  }
                                : null,
                            child: const Text("Creating Account",
                                style: TextStyle(color: Colors.white))),


                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      )
    ]));
  }
}
