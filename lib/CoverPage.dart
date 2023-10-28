import 'package:flutter/material.dart';

import 'MainScreen.dart';

class CoverPage extends StatefulWidget {
  const CoverPage({Key? key}) : super(key: key);

  @override
  State<CoverPage> createState() => _CoverPageState();
}

class _CoverPageState extends State<CoverPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      // return Material(
      //   leading: IconButton(
      //     onPressed: () {
      //       setState(() {
      //         MainPage.formController.add(false);
      //       });
      //     },
      //     icon: const Icon(Icons.arrow_back),
      //   ),
      //   excludeHeaderSemantics: true,
      //   elevation: 0,
      //   floating: true,
      //   snap: true,
      //   backgroundColor: Colors.grey,
      //   expandedHeight: 200,
      //   pinned: true,
      //   actions: const [
      //     Padding(
      //       padding: EdgeInsets.only(right: 15),
      //       child: Icon(Icons.share),
      //     )
      //   ],

    );
  }
}