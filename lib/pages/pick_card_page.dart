import 'package:demo/providers/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import '../constants/info.dart';

class PickCard extends StatefulWidget {
  @override
  State<PickCard> createState() => _PickCard();
}

class _PickCard extends State<PickCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "PickCard",
      home: Scaffold(
        body: Center(
          child: Material(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 52, 31, 66),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    "lib/assets/images/pic_ui/loveTarotBg.png",
                    fit: BoxFit.fitWidth,
                  ),
                  Column(
                    children: [
                      Container(
                        width: double.maxFinite,
                        child: Container(
                          child: Container(
                            child: Stack(
                              children: [
                                //返回箭头
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                10.w, 50.h, 0, 0),
                                            child: const Icon(
                                              Icons.arrow_back,
                                              color: Colors.white,
                                            )))),
                                //title
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      margin:
                                          EdgeInsets.fromLTRB(0, 50.h, 0, 0),
                                      child: Text(
                                        'Today Tarot',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.sp,
                                            decoration: TextDecoration.none),
                                      )),
                                ),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                        onTap: () {
                                          Logger().i("you click reset");
                                          Provider.of<CardModel>(context,
                                                  listen: false)
                                              .removeFromPreferences();
                                        },
                                        child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 50.h, 10.w, 0),
                                            child: Container(
                                              height: 25.h,
                                              width: 25.h,
                                              child: Image.asset(
                                                "lib/assets/images/pic_ui/reset.png",
                                                fit: BoxFit.fitWidth,
                                              ),
                                            )))),
                                //title
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                          width: double.maxFinite,
                          child: Container(
                              alignment: Alignment.center,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 40.h, 0, 0),
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Consumer<CardModel>(
                                        builder: (context, value, child) {
                                      return Container(
                                          child: Column(children: [
                                        Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(5.0)),
                                              color: const Color.fromARGB(
                                                  255, 55, 40, 67),
                                              border: Border.all(
                                                  color: const Color.fromARGB(
                                                      255, 73, 56, 93),
                                                  width: 2),
                                            ),
                                            height: 225.h,
                                            width: 150.w,
                                            child: Consumer<CardModel>(builder:
                                                (context, card, child) {
                                              if (card.isSelected) {
                                                return Image.asset(
                                                  "${card.Url}",
                                                  fit: BoxFit.fill,
                                                );
                                              } else {
                                                return DragTarget(builder:
                                                    (context, candidateData,
                                                        rejectedData) {
                                                  return Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "Drag to Here",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16.sp),
                                                      ));
                                                }, onAccept: (int data) {
                                                  setState(() {
                                                    Provider.of<CardModel>(
                                                            context,
                                                            listen: false)
                                                        .setInfo(data);
                                                  });
                                                });
                                              }
                                            })),
                                      ]));
                                    })),
                              ))),
                      Container(
                        width: double.maxFinite,
                        child: Selector<CardModel, bool>(
                          selector: (context, card) => card.isSelected,
                          builder: (context, isSelected, child) {
                            if (isSelected) {
                              return Container(
                                child: Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(0, 20.h, 0, 0),
                                      child: Text(
                                        '${Provider.of<CardModel>(context, listen: true).Name}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      height: 5,
                                      width: 120,
                                      margin:
                                          EdgeInsets.fromLTRB(0, 20.h, 0, 0),
                                      decoration:  BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5.h)),
                                          gradient: const LinearGradient(
                                              begin: Alignment
                                                  .centerLeft, //渐变开始于上面的中间开始
                                              end: Alignment
                                                  .centerRight, //渐变结束于下面的中间
                                              colors: [
                                                Color(0xFF8B4C9C),
                                                Color(0xFF7C5EBB)
                                              ])),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(0, 20.h, 0, 0),
                                      child: Text(
                                          '${Provider.of<CardModel>(context, listen: true).KeyWord}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Container(
                                        margin: EdgeInsets.fromLTRB(
                                            20.w, 20.h, 20.w, 0),
                                        child: Text(
                                            '${Provider.of<CardModel>(context, listen: true).Description},',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.sp)))
                                  ],
                                ),
                              );
                            } else {
                              return Container(
                                height: 250.h,
                                margin: EdgeInsets.fromLTRB(0, 40.h, 0, 0),
                                child: Column(
                                  children: [
                                    Container(
                                        height: 150.h,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: cardList.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              //创建拖拽项
                                              return Draggable(
                                                feedback: Material(
                                                  child: Transform.scale(
                                                      scale: 1.1,
                                                      child: Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                                  5.h),
                                                          child: Image.asset(
                                                              "lib/assets/images/pic_ui/card.png"))),
                                                ),
                                                data: index,
                                                childWhenDragging: Container(),
                                                child: Container(
                                                    margin: EdgeInsets.all(5.h),
                                                    child: Image.asset(
                                                        "lib/assets/images/pic_ui/card.png")),
                                              );
                                            })),
                                    Container(
                                      margin: EdgeInsets.all(10.h),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '<------------------------------->',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                            decoration: TextDecoration.none),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(10.h),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Drag 1  card  from the packages',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                            decoration: TextDecoration.none),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      //)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
