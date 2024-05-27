import 'package:demo/pages/home_page.dart';
import 'package:demo/providers/card_model.dart';
import 'package:demo/providers/my_favorite_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/advisor_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CardModel card = CardModel("", "", "", "", false);
  MyFavorite favorite=MyFavorite([]);
  await card.loadFromPreferences();
  runApp(MyApp(card,favorite));
}

class MyApp extends StatefulWidget{
  CardModel _card;
  MyFavorite _favorite;
  MyApp(this._card,this._favorite);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(providers: [
      ChangeNotifierProvider<CardModel>.value(value: widget._card,),
      ChangeNotifierProvider<MyFavorite>.value(value: widget._favorite)
    ],
        child: const MaterialApp(
          home: Scaffold(
            body: Tarot(),
          ),
        ),
    );
  }
}
