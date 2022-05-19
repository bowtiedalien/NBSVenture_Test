import 'package:flutter/material.dart';
import 'package:task1/custom_router.dart';
import 'package:task1/models/OrdersModel.dart';
import 'package:task1/styles.dart';

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
                margin: EdgeInsets.fromLTRB(0, 19, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      totalTodayRevenue.toString() + " TL",
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

Widget OrderCard(
    String orderNo,
    int orderItemsCount,
    String orderDateTime,
    int orderSold,
    int orderDriver,
    int orderFood,
    int orderCommission,
    int orderNetProfit) {
  return Card(
    margin: EdgeInsets.fromLTRB(25, 20, 25, 20),
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
                style: TextStyle(color: Color(0xFF707070), fontSize: 12),
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
              Text('Driver', style: TextStyle(color: greyColor, fontSize: 12)),
              Text('Food', style: TextStyle(color: greyColor, fontSize: 12)),
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
              VerticalDivider(thickness: 1, width: 1, color: Colors.black),
              Text(
                orderFood.toString(),
                style: TextStyle(
                    color: redColor, fontSize: 15, fontWeight: FontWeight.bold),
              ),
              VerticalDivider(thickness: 1, width: 1, color: Colors.black),
              Text(
                orderCommission.toString(),
                style: TextStyle(
                    color: yellowColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              VerticalDivider(thickness: 1, width: 1, color: Colors.black),
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
  );
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
