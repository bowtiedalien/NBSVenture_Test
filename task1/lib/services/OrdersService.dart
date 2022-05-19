import 'dart:io';
import 'package:dio/dio.dart';

class OrderService {
  late Dio dio;
  String baseUrl = "";

  // constructor
  OrderService() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
  }

  Future getUserLog() async {
    var dioResponse = await dio.get('$baseUrl/GetAllOrders');

    // return orders list
    return dioResponse.data;
  }
}
