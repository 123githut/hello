import 'package:flutter/cupertino.dart';

Future func1() async {
  debugPrint('func start');
  await Future.delayed(const Duration(seconds: 1));
  debugPrint('func end');
}

void test1() {
  debugPrint('start');
  func1();
  debugPrint('end');
}


void main(){
  test2();
}
Future func2() async {
  await Future.delayed(const Duration(seconds: 1));
  debugPrint('func end');
}
void test2() {
  debugPrint('start');
  debugPrint('func start');
  func2();
  debugPrint('end');
}
