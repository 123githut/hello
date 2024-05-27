import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/advisor_model.dart';

class FavoriteController extends GetxController {
  late Box<Advisors>  favoriteBox;
  List<Advisors> advisorsList = <Advisors>[].obs;
  List<Advisors> get list=>advisorsList;
  @override
  Future<void> onInit() async {
    super.onInit();
    await _initBox();
  }

  Future<void> _initBox() async {
    if (!Hive.isBoxOpen('advisorsBox')) {
      favoriteBox = await Hive.openBox<Advisors>('advisorsBox');
    } else {
      favoriteBox = Hive.box<Advisors>('advisorsBox');
    }
    advisorsList.assignAll(favoriteBox.values.toList());
  }

  Future<void> add( Advisors advisors) async{
    favoriteBox.putAt(0, advisors);
    // 重新获取所有的 Advisor 对象并更新 advisors 列表
    advisorsList.assignAll(favoriteBox.values.toList());
  }

  Future<void> modify(Advisors advisors) async{
    favoriteBox.delete(advisors);
    favoriteBox.add(advisors);
    advisorsList.assignAll(favoriteBox.values.toList());
  }

}
