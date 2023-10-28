import 'dart:async';
import 'package:flutter/material.dart';
import 'package:SmartWash/FormPage.dart';
import 'package:SmartWash/HomePage.dart';
import 'package:SmartWash/IronService.dart';
import 'AccountPage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
    int index = 0;
    bool temp = false;
    bool demo = false;

    @override
    Widget build(BuildContext context) {
      // list bottom Navigation to change page
      final List<Widget> pageList = <Widget>[
        const HomePage(),
        const FormPage(),
        const AccountPage(),
        const IronService(),
      ];
      return Scaffold(
        body: pageList[index],

        // Bottomnavigation
        bottomNavigationBar: SizedBox(
          height: 65,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            unselectedItemColor:  Colors.black45,
            currentIndex: index,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },

            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedIconTheme: const IconThemeData(color: Colors.black45),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance),
                  label: "HOME"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_chart_outlined),
                  label: "ORDER"),

              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_sharp),
                  label: "Account"),
            ],
          ),
        ),
      );
  }
}
