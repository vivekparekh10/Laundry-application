import 'package:SmartWash/FormPage.dart';
import 'package:SmartWash/IronService.dart';
import 'package:flutter/material.dart';
import 'package:SmartWash/AccountPage.dart';
import 'package:SmartWash/DryClean.dart';
import 'package:SmartWash/HomePage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'loginpage.dart';

void main() {
  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/signin',
      routes: {
        '/signin' : (context) =>  LoginPage(),
      }));
}