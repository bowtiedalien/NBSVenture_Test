import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Business Name'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Variables
    String orderNo = "#22492249";
    int orderSold = 240;
    int orderItemsCount = 3;
    String orderDateTime = "04 Aug 2021 - 16:15pm";
    int orderDriver = 30;
    int orderFood = 210;
    double orderCommission = 18.2;
    double orderNetProfit = 191.8;

    return Scaffold(
      backgroundColor: Color(0xFFF8F8F8).withOpacity(0.9),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFF),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomAppBar(
            color: Color(0xFFFFFF).withOpacity(0.8),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                      minWidth: 20,
                      onPressed: () {
                        // go to screen A
                      },
                      child: FaIcon(
                        FontAwesomeIcons.user,
                        color: greyColor,
                      )),
                  MaterialButton(
                      minWidth: 20,
                      onPressed: () {
                        // go to screen B
                      },
                      child: FaIcon(
                        FontAwesomeIcons.car,
                        color: greyColor,
                      )),
                  MaterialButton(
                      minWidth: 20,
                      onPressed: () {
                        // go to screen C
                      },
                      child: FaIcon(
                        FontAwesomeIcons.store,
                        color: greyColor,
                      )),
                  MaterialButton(
                      minWidth: 20,
                      onPressed: () {
                        // go to screen D
                      },
                      child: FaIcon(
                        FontAwesomeIcons.wallet,
                        color: greenColor,
                      )),
                  MaterialButton(
                      minWidth: 20,
                      onPressed: () {
                        // go to screen E
                      },
                      child: Icon(Icons.restaurant_menu))
                ],
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 150,
        title: Column(
          children: [
            Text(
              widget.title,
              textAlign: TextAlign.left,
              style: TextStyle(color: Color(0xFF303030)),
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Card(
                      color: yellowColor.withOpacity(0.7),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(13, 11, 6, 12),
                        child: Column(
                          children: [
                            Text(
                              'Today\'s Revenue',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text('732.00'),
                            Text(
                              '5 Orders',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    Card(
                      color: yellowColor.withOpacity(0.7),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(13, 11, 6, 12),
                        child: Column(
                          children: [
                            Text(
                              'Week so far',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text('1531.00'),
                            Text(
                              '10 Orders',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 15,
                    ),
                    Card(
                      color: yellowColor.withOpacity(0.7),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(13, 11, 6, 12),
                        child: Column(
                          children: [
                            Text(
                              'Monthly Revenue',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text('3200.00'),
                            Text(
                              '18 Orders',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider()
                  ],
                ),
              ),
            )
          ],
        ),
        backgroundColor: yellowColor,
      ),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.all(25),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: greenColor, width: 1)),
            child: Container(
              padding: EdgeInsets.all(13),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        orderNo,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        orderItemsCount.toString() + " items",
                        style: TextStyle(
                            color: Color(0xFF1F6E1A),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Container(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        orderDateTime,
                        style:
                            TextStyle(color: Color(0xFF707070), fontSize: 12),
                      ),
                      RichText(
                        text: TextSpan(
                          style: new TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            new TextSpan(text: 'Sold '),
                            new TextSpan(
                                text: orderSold.toString(),
                                style: TextStyle(
                                    fontSize: 15,
                                    color: redColor,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Driver',
                          style: TextStyle(color: greyColor, fontSize: 12)),
                      Text('Food',
                          style: TextStyle(color: greyColor, fontSize: 12)),
                      Text('commission',
                          style: TextStyle(color: greyColor, fontSize: 12)),
                      Text('Net profit',
                          style: TextStyle(color: greyColor, fontSize: 12)),
                    ],
                  ),
                  Container(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        orderDriver.toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      VerticalDivider(
                          thickness: 1, width: 1, color: Colors.black),
                      Text(
                        orderFood.toString(),
                        style: TextStyle(
                            color: redColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      VerticalDivider(
                          thickness: 1, width: 1, color: Colors.black),
                      Text(
                        orderCommission.toString(),
                        style: TextStyle(
                            color: yellowColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      VerticalDivider(
                          thickness: 1, width: 1, color: Colors.black),
                      Text(
                        orderNetProfit.toString(),
                        style: TextStyle(
                            color: greenColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
