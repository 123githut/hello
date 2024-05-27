import 'package:demo/utils/persistent_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import '../constants/info.dart';

class CardModel extends ChangeNotifier {
  String? _cardUrl;
  String? _cardName;
  String? _cardDescription;
  String? _cardKeyWord;
  bool _isSelected = false;

  String? get Url => _cardUrl;
  String? get Name => _cardName;
  String? get Description => _cardDescription;
  String? get KeyWord => _cardKeyWord;
  bool get isSelected => _isSelected;

  CardModel(
    this._cardUrl,
    this._cardName,
    this._cardKeyWord,
    this._cardDescription,
    this._isSelected,
  );

  Future<void> loadFromPreferences() async {
    var ps = PersistentStorage();
    _cardUrl = await ps.getStorage("Url") as String?;
    _cardName = await ps.getStorage("Name") as String?;
    _cardKeyWord = await ps.getStorage("KeyWord") as String?;
    _cardDescription = await ps.getStorage("Description") as String?;
    _isSelected = await ps.hasKey("Url");
    notifyListeners();
  }

  Future<void> removeFromPreferences() async {
    var ps = PersistentStorage();
    ps.clear();
    loadFromPreferences();
    notifyListeners();
  }

  setInfo(int index) {
    this._cardUrl = cardList[index]._cardUrl;
    this._cardName = cardList[index]._cardName;
    this._cardDescription = cardList[index]._cardDescription;
    this._cardKeyWord = cardList[index]._cardKeyWord;
    this._isSelected = true;
    var ps = PersistentStorage();
    ps.setStorage("Url", this._cardUrl);
    ps.setStorage("Name", this._cardName);
    ps.setStorage("KeyWord", this._cardKeyWord);
    ps.setStorage("Description", this._cardDescription);
    ps.setStorage("isSelected ", this._isSelected);
    notifyListeners();
  }
}
