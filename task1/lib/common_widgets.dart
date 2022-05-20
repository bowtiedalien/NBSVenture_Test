import 'package:flutter/material.dart';
import 'styles.dart';

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
    margin: EdgeInsets.fromLTRB(25, 20, 25, 5),
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
              Container(width: 5),
              Text('Driver', style: TextStyle(color: greyColor, fontSize: 12)),
              Container(width: 20),
              Text('Food', style: TextStyle(color: greyColor, fontSize: 12)),
              Container(width: 23),
              Text('commission',
                  style: TextStyle(color: greyColor, fontSize: 12)),
              Container(width: 5),
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
              Container(
                height: 15,
                child: VerticalDivider(color: Colors.grey),
              ),
              Text(
                orderFood.toString(),
                style: TextStyle(
                    color: redColor, fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Container(height: 15, child: VerticalDivider(color: Colors.grey)),
              Text(
                orderCommission.toString(),
                style: TextStyle(
                    color: yellowColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Container(height: 15, child: VerticalDivider(color: Colors.grey)),
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
