import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:SmartWash/SavedAddress.dart';
import 'package:SmartWash/Support.dart';
import 'package:SmartWash/TermsCondition.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);
  static List<Test>? listWork;
  static int? index;

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    List<Test> list = [
      Test(
        tegline: "Clothes",
        image: "images/cloths.png",
      ),
      Test(
        tegline: "Curtain",
        image: "images/curtain.png",
      ),
      Test(
        tegline: "T-shirts",
        image: "images/bg.png",
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Account',
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            // top: MediaQuery.of(context).size.height / 4.5,
            bottom: MediaQuery.of(context).size.height / 50,
            right: MediaQuery.of(context).size.width / 100,
            left: MediaQuery.of(context).size.width / 70),
        child:

        ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Saved Address'),onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SavedAddress()));

              },
            ),
            ListTile(
              leading: Icon(Icons.wallet),
              title: Text('Wallet'),onTap: () {

              },
            ),
            ListTile(
              leading: Icon(Icons.contact_page_outlined),
              title: Text('Terms & Conditions'),
                onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => TermsCondition()));},
            ),
            ListTile(
              leading: Icon(Icons.support_agent),
              title: Text('Support'),
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Support()));

              },
            ),
            // ListTile(
            //   leading: Icon(Icons.settings),
            //   title: Text('Setting'),
            //   onTap: () {
            //
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}

class Test {
  Test({
    required this.tegline,
    required this.image,
  });

  String tegline;
  String image;
}
