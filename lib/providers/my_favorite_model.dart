import 'package:flutter/cupertino.dart';

import '../models/advisor_model.dart';


class MyFavorite with ChangeNotifier {
  List<Advisors> _favoriteAdvisors = [];

  List<Advisors> get favoriteAdvisors => _favoriteAdvisors;
  MyFavorite(this._favoriteAdvisors);

  void addAdvisor(Advisors advisor) {
    _favoriteAdvisors.insert(0, advisor);
    if (_favoriteAdvisors.length > 6) {
      _favoriteAdvisors.removeLast();
    }
    notifyListeners();
  }

  void changeSequence(Advisors advisor) {
    _favoriteAdvisors.remove(advisor);
    addAdvisor(advisor);
    notifyListeners();
  }
}