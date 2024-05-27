import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'as http;
import '../models/order_model.dart';
void main(List<String> arguments) async{
  //1.创建客户端
  //2.创建request --->url
  //3.获得response
  //4.客户端进行关闭
  //await HttpClientTest();
  await HttpTest();
  // Dio dio=Dio();
  // Response response=await dio.get('https://c5qyslgwde.execute-api.us-east-1.amazonaws.com/prod/order-list');
  // //
  // if (response.statusCode == 200) {
  //   // 解析 JSON 数组
  //   try {
  //     // 将 JSON 数据解析为 List<Map<String, dynamic>> 类型的对象数组
  //     List<Map<String, dynamic>> jsonData = jsonDecode(response.data);
  //
  //     // 使用 map 方法将每个 JSON 数据转换为 Order 对象
  //     List<Order> orders = jsonData.map((json) => Order.fromJson(json)).toList();
  //     //Order orders = Order.fromJson(jsonData);
  //   } catch (e) {
  //     print('Error: $e'); // 捕获异常并打印错误信息
  //   }
  // }

}

Future<void> HttpTest() async {
  String url="https://c5qyslgwde.execute-api.us-east-1.amazonaws.com/prod/order-list";
  http.Client client=http.Client();
  http.Response response=await client.get(Uri.parse(url));
   // 将 JSON 数据解析为 List<Map<String, dynamic>> 类型的对象数组
   String jsonResponse=response.body;
   List<dynamic> jsonData = jsonDecode(jsonResponse);
   // 使用 map 方法将每个 JSON 数据转换为 Order 对象，并进行类型转换为 List<Order>
   List<Order> orders = jsonData.map((json) => Order.fromJson(json)).toList();
   print(orders.length);
}

Future<void> HttpClientTest() async {
  HttpClient client=HttpClient();
  String url="https://c5qyslgwde.execute-api.us-east-1.amazonaws.com/prod/order-list";
  HttpClientRequest request=await client.getUrl(Uri.parse(url));
  HttpClientResponse response=await request.close();
  print(response.statusCode);
  var result=await response.transform(utf8.decoder).join();
  print(result);
  client.close();
}