import 'package:SmartWash/BillPage.dart';
import 'package:flutter/material.dart';

class WashandIron extends StatefulWidget {
  const WashandIron({Key? key}) : super(key: key);

  @override
  _WashandIron createState() => _WashandIron();
}

class _WashandIron extends State<WashandIron> {
  Map<String, int> items = {
    'Pant': 0,
    'T-Shirt': 0,
    'Jubba': 0,
    // 'payjama':0,
    // 'Ladiestop':0,
    // 'Saree':0,
    // 'Shirt':0,
  };
  Map<String, double> itemPricemap = {
    'Pant': 6,
    'T-Shirt': 6,
    'Jubba':  6,
    // 'payjama':6,
    // 'Ladiestop':  6,
    // 'Saree':10,
    // 'Shirt':6,
  };

  Map<String, String> itemAsset = {
    'Pant': 'images/pant.jpg',
    'T-Shirt': 'images/t-shirt.jpg',
    'Jubba':  'images/jubba.jpeg',
    // 'payjama':'images/payjama.jpg',
    // 'Ladiestop':  'images/ladiestop.jpeg',
    // 'Saree':'images/saree.jpg',
    // 'Shirt':'images/shirt.jpg',
  };

  void addItem(String itemName, int itemQuantity) {
    setState(() {
      if (items.containsKey(itemName)) {
        if (itemQuantity >= 0) {
          items.update(itemName, (value) => itemQuantity += 1);
          print(items[itemQuantity]);

        }
      }
    });
  }

  void removeItem(String itemName, int itemQuantity) {
    setState(() {
      if (items.containsKey(itemName)) {
        if (itemQuantity == 1) {
          items.update(itemName, (value) => itemQuantity = 0);
          //  print(items[itemQuantity]);
        }
        if(itemQuantity > 1){
          items.update(itemName, (value) => itemQuantity -= 1);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(

              itemCount: items.length,
              itemBuilder: (context, index) {
                String itemName = items.keys.elementAt(index);
                int itemQuantity = items.values.elementAt(index);
                double itemPrice = itemPricemap.values.elementAt(index);
                String itemImage = itemAsset.values.elementAt(index);

                return Card(
                  elevation: 5.0,

                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Image.asset(itemImage,width: 100,
                            height: 80),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          itemName,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          '$itemPrice/-',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          removeItem(itemName, itemQuantity);
                        },
                      ),
                      Text(
                        '$itemQuantity',
                        style: TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          addItem(itemName, itemQuantity);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey.shade300,
                  width: 3,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${_calculateTotalPrice()}/-',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: () {
              print(items.toString());
              double totalPrice = _calculateTotalPrice();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BillPage(items,totalPrice);
              },));


            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Checkout',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _calculateTotalPrice() {
    double totalPrice = 0;
    items.forEach((itemName, itemQuantity) {
      itemPricemap.forEach((key, itemPrice) {
        if (itemName == key) {
          totalPrice += (itemQuantity * itemPrice);
        }
      });
    });
    return totalPrice;
  }
}