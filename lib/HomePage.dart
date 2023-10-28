import 'package:SmartWash/Household.dart';
import 'package:SmartWash/BillPage.dart';
import 'package:flutter/material.dart';
import 'package:SmartWash/DryClean.dart';
import 'package:SmartWash/IronService.dart';
import 'package:SmartWash/WashandIron.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {

    //Name and icon List
    List<Count> data = [
      Count("IRON PRESS " ,"images/iron1.png",),
      Count("WASH&IRON","images/washandiron.png"),
      Count("DRY CLEAN", "images/dc.png"),
      Count("HOUSEHOLD CLEAN", "images/curtain.png"),


    ];
    return Scaffold(
        body: Container( decoration: BoxDecoration(borderRadius:BorderRadius.only(),
          gradient: LinearGradient(
            colors: [Colors.white70, Colors.deepPurpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            stops: [0.3, 10],
            tileMode: TileMode.repeated,
          ),
        ),
          child: Stack(
            children: [
              // gridview biulder
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2.2,
                      bottom: MediaQuery.of(context).size.height / 50,
                      right: MediaQuery.of(context).size.width / 100,
                      left: MediaQuery.of(context).size.width / 70),
                  child: GridView.builder(
                    itemCount: data.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1,
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing:10),
                    itemBuilder: (context, index) {

                      return GestureDetector(
                        onTap: ()
                        {
                         if(index == 0){
                           Navigator.push(context, MaterialPageRoute(builder: (context) => IronService()));
                         }
                         else if(index == 1){
                           Navigator.push(context, MaterialPageRoute(builder: (context) => WashandIron()));
                         }
                         else if(index == 2){
                           Navigator.push(context, MaterialPageRoute(builder: (context) => DryClean()));
                         }
                         else if(index == 3){
                           Navigator.push(context, MaterialPageRoute(builder: (context) => Household()));
                         }

                        },

                        child: Card(
                              color: Colors.deepPurple,
                              elevation: 0.3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9.0)),
                              child: Column(
                                children: [
                                  Center(child: Image(image: AssetImage(data[index].image),height: 100,width: 100,)),
                              Padding(
                              padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 29),
                        child: Text(data[index].title,
                        style: const TextStyle(color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                        ),
                            ])),
                      );
                    },
                  )),

              // Background image
              Image(
                image: const AssetImage('images/12.png'),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
              ),

              // Heading Text
              Positioned(
                  top: MediaQuery.of(context).size.height / 4,
                  left: MediaQuery.of(context).size.width / 2.4,
                  child: const Text("Smart Wash",
                      style: TextStyle(fontSize: 30, color: Colors.white,fontWeight: FontWeight.w900))),

              // Search TextFiel
              // Positioned(
              //   width: MediaQuery.of(context).size.width / 1.15,
              //   top: MediaQuery.of(context).size.height / 2.8,
              //   height: MediaQuery.of(context).size.height / 15,
              //   left: MediaQuery.of(context).size.width / 16,
              //   child: TextField(
              //     decoration: InputDecoration(
              //         hintText: 'Search for Laundry Items',
              //         prefixIcon: const Icon(
              //           Icons.search,
              //           color: Colors.black45,
              //         ),
              //         fillColor: Colors.white,
              //         filled: true,
              //         enabledBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(25),
              //             borderSide: const BorderSide(color: Colors.white)),
              //         focusedBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(25),
              //             borderSide: const BorderSide(color: Colors.white))),
              //   ),
              // ),
            ],
          ),

        ));
  }
}

//For grid
class Count {
  Count(this.title, this.image);

  String title;
  String image;

}
