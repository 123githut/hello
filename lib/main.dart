import 'dart:ui';
import 'package:demo/info.dart';
import 'package:demo/pick_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'model/card_model.dart';
import 'counsel.dart';
import 'my_order.dart';

//首页
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CardModel card = CardModel("", "", "", "", false);
  await card.loadFromPreferences();
  runApp(Myapp(card));
}

class Myapp extends StatelessWidget {
  late final CardModel _card;
  Myapp(this._card);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return ChangeNotifierProvider<CardModel>.value(
          value: this._card,
          child: MaterialApp(
              title: "2024-5-8",
              home: Scaffold(
                body: homePage(),
                resizeToAvoidBottomInset: true,
              )),
        );
      },
    );
    // TODO: implement build
    //return MaterialApp(title: "2024-5-8", home: Scaffold(body: homePage()));
  }
}

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
        child: Container(
      color: Color.fromARGB(255, 52, 31, 66),
      height: double.maxFinite,
      width: double.maxFinite,
      child: Column(
        children: [
          //顾问列表部分
          Expanded(flex: 5, child: ConsultantInfo()),
          //抽卡部分
          Expanded(flex: 3, child: Enter()),
        ],
      ),
    ));
  }
}

class ConsultantInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Stack(
        children: [
          Image.asset("images/tarotBg.png", fit: BoxFit.fitWidth),
          Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(10, 50, 0, 0),
                        child: Text(
                          'TAROT',
                          style: TextStyle(
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.sp),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 20, 25, 0),
                        child: Row(
                          children: [
                            Text(
                              'Free 5 Min with Tarot Masters',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 238, 214, 215),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          height: 40.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 253, 237, 212),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: EdgeInsets.fromLTRB(10, 50, 25, 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return OrderPage();
                              }));
                            },
                            child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Orders',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ))),
                ],
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  height: 230.h,
                  width: double.maxFinite,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: advisors.length,
                      itemBuilder: (context, index) {
                        return MyConsultant(index);
                      }))
            ],
          ),
        ],
      ),
    );
  }
}

class Enter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: [
          //General Tarot Card Reading
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
            child: Text(
              'General Tarot Card Reading',
              style: TextStyle(
                  color: Color.fromARGB(255, 238, 214, 215),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp),
            ),
          ),
          //动画卡片
          Container(
            //color: Colors.lightBlue,
            margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
            width: double.maxFinite,
            child: Stack(
              children: [
                //抽卡入口/查看详情
                Container(
                  alignment: Alignment.center,
                  child: Consumer<CardModel>(
                    builder: (context, card, child) {
                      if (card.isSelected) {
                        return ViewDetailsEnter();
                      } else {
                        return PickCardEnter();
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

/**
 *
 */

/*
Tarot顾问列表设置
 */
class MyConsultant extends StatelessWidget {
  int index;

  MyConsultant(this.index);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(5),
      height: 230.h,
      width: 200.w,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 200.h,
                width: 200.w,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/tarotCardBg.png'),
                          fit: BoxFit.cover)),
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 60, 10, 0),
                        child: Text(advisors[index].advisorName ?? 'unknown',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Text(advisors[index].advisorDesc ?? 'unknown',
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.sp),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Container(
                          height: 40.h,
                          width: 120.w,
                          margin: EdgeInsets.fromLTRB(5, 10, 10, 20),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft, //渐变开始于上面的中间开始
                                  end: Alignment.centerRight, //渐变结束于下面的中间
                                  colors: [
                                    Color(0xFF8B4C9C),
                                    Color(0xFF7C5EBB)
                                  ])),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Counsel(
                                            advisors[index].advisorAvatar ??
                                                'unknown',
                                            advisors[index].advisorName ??
                                                'unknown')));
                              },
                              style: ButtonStyle(
                                //设置按钮的大小
                                minimumSize: MaterialStateProperty.all(
                                    const Size(100, 20)),
                                //设置形状 圆角 半径为8
                                shape: MaterialStateProperty.all(
                                  const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                ),
                              ),
                              child: Text(
                                "Free 5 Min",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14.sp),
                              ))),
                    ],
                  ),
                )),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 100,
              width: 100,
              child: Stack(
                children: [
                  Container(
                      alignment: Alignment.center,
                      child: Container(
                          height: 100.h,
                          width: 100.w,
                          child: Image.asset("images/picTarotFram.png"))),
                  Container(
                      alignment: Alignment.center,
                      child: Container(
                          alignment: Alignment.center,
                          height: 62.h,
                          width: 62.w,
                          child: AspectRatio(
                              aspectRatio: 1.0,
                              child: ClipOval(
                                child: Image.network(
                                  advisors[index].advisorAvatar ?? 'unknown',
                                  fit: BoxFit.cover,
                                ),
                              )))),
                  Align(
                    child: Container(
                      alignment: Alignment.bottomRight,
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.green),
                          height: 10,
                          width: 10))
                ],
              ),
              // child: Image.asset(
              //     "img/me.png"
              //  ),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> resultShow = [PickCardEnter(), ViewDetailsEnter()];

class PickCardEnter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: AssetImage('images/tarotTodayTarot.png'),
              fit: BoxFit.cover)),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      'Today Tarot',
                      style: TextStyle(
                          color: Color.fromARGB(255, 238, 214, 215),
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    // color: Colors.black,
                    height: 60.h,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PickCard()));
                        },
                        child: Stack(
                          children: [
                            Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                height: 90.h,
                                width: 150.w,
                                child: Lottie.asset(
                                    "lottie/tarotButtonBig/data.json",
                                    fit: BoxFit.fill)),
                            Container(
                              width: 150.w,
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                              alignment: Alignment.center,
                              child: Text(
                                'Pick Card',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
          //洗牌
          Expanded(
              flex: 1,
              child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Container(
                    height: 120.h,
                    width: 180.w,
                    // color: Colors.black,
                    child: Lottie.asset("lottie/tarotHome/data.json",
                        repeat: false),
                  ))),
        ],
      ),
    );
  }
}

class ViewDetailsEnter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 180.h,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: 150.h,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      color: Color.fromARGB(255, 55, 40, 67),
                      border: Border.all(
                          color: Color.fromARGB(255, 73, 56, 93), width: 2),
                    ),
                    child: Column(
                      children: [
                        Container(
                            height: 90.h,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: Image.asset(
                                    "images/todayTarot.png",
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.all(5),
                                    child: Text(
                                      "${DateTime.now().month.toString()}"
                                      "${DateTime.now().day.toString().padLeft(3, ' ')}"
                                      "${DateTime.now().year.toString().padLeft(6, ' ')} ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            alignment: Alignment.centerLeft,
                            height: 45.h,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return PickCard();
                                }));
                              },
                              child: Image.asset(
                                fit: BoxFit.fitHeight,
                                "images/tarotViewDetails.png",
                              ),
                            ))
                      ],
                    ))),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: Column(
                  children: [
                    Container(
                      height: 120.h,
                      width: 80.w,
                      child: Image.asset(
                        "${Provider.of<CardModel>(context, listen: true).Url}",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      child: Text(
                        "${Provider.of<CardModel>(context, listen: true).Name}",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
