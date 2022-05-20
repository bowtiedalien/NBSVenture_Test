import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:task1/custom_router.dart';
import 'package:task1/data.dart';
import 'package:task1/screens/second_screen.dart';
import 'common_widgets.dart';
import 'styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  calculateTodaysRevenue();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Business Name'),
      onGenerateRoute: CustomRouter.allRoutes,
      initialRoute: homeRoute,
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
                          // go to screen E - current screen
                        },
                        child: Icon(Icons.restaurant_menu))
                  ],
                ),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 200,
          centerTitle: false,
          title: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child: Text(
                    widget.title,
                    style: TextStyle(color: Color(0xFF303030)),
                  ),
                ),
              ),
              Container(
                // list of clickable cards in appbar
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, secondPage);
                        },
                        child: Card(
                          color: yellowColor.withOpacity(0.7),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(13, 11, 6, 12),
                            child: Column(
                              children: [
                                Text(
                                  'Today\'s Revenue',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Container(height: 12),
                                RevenueText(totalTodayRevenue),
                                Container(height: 12),
                                OrderCountText(
                                    orderObjWithTodayDate.length.toString() +
                                        " orders")
                              ],
                            ),
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
                                textAlign: TextAlign.left,
                              ),
                              Container(height: 12),
                              RevenueText(1531.00),
                              Container(height: 12),
                              OrderCountText("10 Orders")
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
                              Container(height: 12),
                              RevenueText(3200.00),
                              Container(height: 12),
                              OrderCountText("18 Orders")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.white,
              )
            ],
          ),
          backgroundColor: yellowColor,
        ),
        body: ListView.builder(
            // order cards list
            itemCount: orderObj.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return OrderCard(
                  orderObj[index].orderNo,
                  orderObj[index].orderItemsCount,
                  orderObj[index].orderDateTime,
                  orderObj[index].orderSold,
                  orderObj[index].orderDriver,
                  orderObj[index].orderFood,
                  orderObj[index].orderCommission,
                  orderObj[index].orderNetProfit);
            }));
  }
}

Widget RevenueText(double rev) {
  return Text(
    rev.toStringAsFixed(2),
    style: TextStyle(fontWeight: FontWeight.bold),
    textAlign: TextAlign.left,
  );
}

Widget OrderCountText(String txt) {
  return Text(
    txt,
    style: TextStyle(color: Colors.white),
  );
}
