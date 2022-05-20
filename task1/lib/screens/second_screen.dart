import 'package:flutter/material.dart';
import 'package:task1/custom_router.dart';
import 'package:task1/models/OrdersModel.dart';
import 'package:task1/styles.dart';
import '../common_widgets.dart';
import '../data.dart';

List<Order> orderObjWithTodayDate = [];
double totalTodayRevenue = 0.00;

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    // # DEBUG
    print('printing order object...');
    print(orderObj);

    return Scaffold(
        backgroundColor: yellowColor,
        body: Container(
          margin: EdgeInsets.fromLTRB(25, 31, 25, 0),
          child: Column(
            children: [
              Container(
                // appbar
                width: 300,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xFF303030)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.pushNamed(context, homeRoute),
                    ),
                    Container(width: 50),
                    Container(
                      child: Text(
                        'Today\'s Revenue',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // horizontal info line after appbar
                margin: EdgeInsets.fromLTRB(0, 19, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      totalTodayRevenue.toString() + " Tl",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      orderObjWithTodayDate.length.toString() + " orders",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    )
                  ],
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              Flexible(
                  // list of today's transactions
                  child: ListView.builder(
                itemCount: orderObjWithTodayDate.length,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return OrderCard(
                      orderObjWithTodayDate[index].orderNo,
                      orderObjWithTodayDate[index].orderItemsCount,
                      orderObjWithTodayDate[index].orderDateTime,
                      orderObjWithTodayDate[index].orderSold,
                      orderObjWithTodayDate[index].orderDriver,
                      orderObjWithTodayDate[index].orderFood,
                      orderObjWithTodayDate[index].orderCommission,
                      orderObjWithTodayDate[index].orderNetProfit);
                },
              ))
            ],
          ),
        ));
  }
}

calculateTodaysRevenue() {
  // filter out today's Revenue list
  // (assuming today's date is 12 Aug 2021)

  for (var i = 0; i < orderObj.length; i++) {
    if (orderObj[i].orderDateTime.contains("12 Aug 2021")) {
      orderObjWithTodayDate.add(orderObj[i]);
      totalTodayRevenue += orderObj[i].orderNetProfit;
    }
  }
}
