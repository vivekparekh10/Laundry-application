import 'package:flutter/material.dart';

class TermsCondition extends StatefulWidget {
  const TermsCondition({Key? key}) : super(key: key);

  @override
  State<TermsCondition> createState() => _TermsConditionState();
}

class _TermsConditionState extends State<TermsCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Terms & Conditions')),

      body:Container(
        child:Stack(children: [Image.asset('images/remove.png',fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height / 2.5,
          width: MediaQuery.of(context).size.width,),


          SizedBox(height: 1000.0,
            child: Row(
              children: [
                Container(
                  child: Positioned(
                       child: const Text("Smart Wash",)


                  ),


                ),
                Container(

                      child: const Text("condition",)





                ),
                          ],
            ),
          ),


        ],)
        ),

















    );

  }
}
