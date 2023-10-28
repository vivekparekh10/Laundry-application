import 'package:flutter/material.dart';

class BillPage extends StatelessWidget {
  Map<String, int> items;
  double totalPrice;

  BillPage(this.items,this.totalPrice);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Bill')),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text('Items:'),


             SizedBox(height: 10),
            for( var element in items.entries) ...[
              Card(elevation: 0.5),
              Text(  element.key + "  X " + element.value.toString()),
            ],
            SizedBox(height: 5),
            Container(decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey.shade300,width: 3)
            )
            )

    ),
            Padding(padding:EdgeInsets.all(10),child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text('Total: ${totalPrice.toStringAsFixed(2)}',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),],),),

            BottomAppBar(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () {
                    print(items.toString());

                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return BillPage(items,totalPrice);
                    },));


                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Pay',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
                 ],
        ),
      ),

    );
  }
}
//
// Container(
// decoration: BoxDecoration(
// border: Border(
// top: BorderSide(
// color: Colors.grey.shade300,
// width: 3,
// ),
// ),
// ),
// child: Padding(
// padding: EdgeInsets.all(16),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// 'Total:',
// style: TextStyle(
// fontSize: 24,
// fontWeight: FontWeight.bold,
// ),
// ),
// Text(
// '${_calculateTotalPrice()}/-',
// style: TextStyle(
// fontSize: 24,
// fontWeight: FontWeight.bold,
// ),
// ),
// ],
// ),
// ),
// ),