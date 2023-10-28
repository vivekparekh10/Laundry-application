import 'package:SmartWash/MainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavedAddress extends StatefulWidget {
  const SavedAddress({Key? key}) : super(key: key);

  @override
  State<SavedAddress> createState() => _SavedAddressState();
}

class _SavedAddressState extends State<SavedAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Saved Address' ,textAlign: TextAlign.center,),
    ),
      body:ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.home),
              title: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      contentPadding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 20),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: " Enter Your Address"),



              )
          ),
          SizedBox(height: 20,
            child: Center(
              child: ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));

              }, child: Text("Submit"),),
            ),
          )


        ],
      ),


    );
  }
}


