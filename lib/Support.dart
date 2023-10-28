import 'package:flutter/material.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Support')),
      body: Container(
          child: Stack(
        children: [

          Image.asset(
            'images/sw.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height / 2.90,
            width: MediaQuery.of(context).size.width/1,
          ),
          SizedBox(
            height: 800.50,
            child: Row(
              children: [
                Container(
                  child: Positioned(
                      child: const Text(
                    "Write to us your querires",style: TextStyle(fontSize: 25,color: Colors.blue,fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,     wordSpacing: 5,),
                      ),
                  ),
                ),
              ],
            ),
          ),
                SizedBox(height:1500,child: Row(children: [Container(child: Icon(Icons.message)),TextFormField(
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

                ) ],))
        ],
      )),
    );
  }
}
