import 'package:demo/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/order_model.dart';
import '../widgets/item.dart';


class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() =>_OrderPage();
}
List<Order> orders = [];
class _OrderPage extends State<OrderPage>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOrders();
  }

  Future<void> getOrders() async {
    http.Client client = http.Client();
    String url =
        "https://c5qyslgwde.execute-api.us-east-1.amazonaws.com/prod/order-list";
    http.Response response = await client.get(Uri.parse(url));
    List<dynamic> jsonData = jsonDecode(response.body);
    setState(() {
      orders = jsonData.map((json) => Order.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Column(
        children: [
          Container(
              color: const Color.fromARGB(255, 245, 234, 224),
              child: Container(
                margin: EdgeInsets.fromLTRB(10.w, 30.h, 20.w, 10.h),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 30.w,
                          height: 30.h,
                          child: const Icon(
                            Icons.arrow_back,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "My Order",
                        style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return MyShop();
                              }));
                        },
                        child: Container(
                          width: 30.w,
                          height: 30.h,
                          child: const Icon(
                            Icons.shopping_cart,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Container(
            height: 500.h,
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return OrderItem(orders[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}



