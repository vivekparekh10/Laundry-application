import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);
  static List<Test>? listWork;
  static int? index;
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
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
        body: Container(  decoration: BoxDecoration(borderRadius:BorderRadius.only(),
          gradient: LinearGradient(
            colors: [Colors.white70, Colors.deepPurpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            stops: [0.3, 10],
            tileMode: TileMode.repeated,
          ),
        ),

          child: Stack(children: [

            //Background Image
            Image(
              image: const AssetImage('images/bg.png'),
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
            ),

            // Headline Text
            Positioned(
                top: MediaQuery.of(context).size.height / 3.1,
                left: MediaQuery.of(context).size.width / 2.1,
                child: const Text(
                  "Orders",
                  style: TextStyle(fontSize: 35, color: Colors.deepPurpleAccent,fontWeight: FontWeight.w900)
                )),

            //Listview
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2.8,
                    right: MediaQuery.of(context).size.width / 28,
                    left: 20),
                child: SizedBox(
                  height: 500,
                  width: 1000,
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        FormPage.listWork =  list;
                        return Card(
                          color: Colors.white,
                          elevation: 0.3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0)),
                          child: Column(children: [
                            // text and image
                            Padding(
                              padding: const EdgeInsets.only(left: 12, right: 25  ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    list[index].image,
                                    height: 50,
                                    width: 50,
                                  ),
                                  Text(
                                    list[index].tegline,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                  )
                                ],
                              ),
                            ),

                            // Rating bar

                          ]),
                        );
                      }),
                )),
          ]),
        ));
  }
}

class Test {
  Test(
      {required this.tegline,
        required this.image,

       });

  String tegline;
  String image;


}