class OrdersModel {
  List ordersList = [];

  Map<String, dynamic> toMap() {
    // convert dart list to json data
    return {
      'orders': ordersList,
    };
  }
}

class Order {
  late String orderNo;
  late int orderItemsCount;
  late String orderDateTime;
  late int orderSold;
  late int orderDriver;
  late int orderFood;
  late int orderCommission;
  late int orderNetProfit;

  Order(
      this.orderNo,
      this.orderItemsCount,
      this.orderDateTime,
      this.orderSold,
      this.orderDriver,
      this.orderFood,
      this.orderCommission,
      this.orderNetProfit);

  factory Order.fromJson(dynamic json) {
    return Order(
        json['orderNo'] as String,
        json['orderItemsCount'] as int,
        json['orderDateTime'] as String,
        json['orderSold'] as int,
        json['orderDriver'] as int,
        json['orderFood'] as int,
        json['orderCommission'] as int,
        json['orderNetProfit'] as int);
  }

  // to be able to print the list of data using print()
  @override
  String toString() {
    return '{ ${this.orderNo}, ${this.orderItemsCount}, ${this.orderDateTime}, ${this.orderSold}, ${this.orderDriver}, ${this.orderFood}, ${this.orderCommission}, ${this.orderNetProfit} }';
  }
}
