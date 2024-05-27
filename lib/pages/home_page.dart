import 'package:demo/pages/order_page.dart';
import 'package:demo/pages/pick_card_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../constants/info.dart';
import '../providers/card_model.dart';
import '../widgets/item.dart';

class Tarot extends StatefulWidget {
  const Tarot({super.key});

  @override
  State<Tarot> createState() => _Tarot();
}

class _Tarot extends State<Tarot> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: ScreenUtilInit(
          designSize: const Size(375, 667),
          minTextAdapt: true,
          splitScreenMode: true,
          // Use builder only if you need to use library outside ScreenUtilInit context
          builder: (_, child) {
            return Material(
                child: Container(
              color: const Color.fromARGB(255, 52, 31, 66),
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Stack(
                      children: [
                        Image.asset("lib/assets/images/pic_ui/tarotBg.png",
                            fit: BoxFit.fitWidth),
                        Align(
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.fromLTRB(
                                            10.w, 50.h, 0.w, 0.h),
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
                                        margin: EdgeInsets.fromLTRB(
                                            10.w, 20, 25, 0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Free 5 Min with Tarot Masters',
                                              style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 238, 214, 215),
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
                                            color: const Color.fromARGB(
                                                255, 253, 237, 212),
                                            borderRadius:
                                                BorderRadius.circular(20.h),
                                          ),
                                          margin: EdgeInsets.fromLTRB(
                                              10.w, 50.h, 25.w, 0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          OrderPage()));
                                            },
                                            child: Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Orders',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.sp),
                                                )),
                                          ))),
                                ],
                              ),
                              Container(
                                  margin: EdgeInsets.all(10.w),
                                  height: 230.h,
                                  width: double.maxFinite,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: advisorList.length,
                                      itemBuilder: (context, index) {
                                        return AdvisorItem(advisorList[index]);
                                      }))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //抽卡部分
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Column(
                        children: [
                          //General Tarot Card Reading
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
                            child: Text(
                              'General Tarot Card Reading',
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 238, 214, 215),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp),
                            ),
                          ),
                          //动画卡片
                          Container(
                            //color: Colors.lightBlue,
                            margin: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h),
                            width: double.maxFinite,
                            child: Stack(
                              children: [
                                //抽卡入口/查看详情
                                Container(
                                  alignment: Alignment.center,
                                  child: Consumer<CardModel>(
                                    builder: (context, card, child) {
                                      if (card.isSelected) {
                                        return Center(
                                          child: Container(
                                            height: 180.h,
                                            child: Stack(
                                              children: [
                                                Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Container(
                                                        height: 150.h,
                                                        width: double.maxFinite,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          5.0)),
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 55, 40, 67),
                                                          border: Border.all(
                                                              color: const Color
                                                                  .fromARGB(255,
                                                                  73, 56, 93),
                                                              width: 2),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                                height: 90.h,
                                                                child: Row(
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .all(5
                                                                              .h),
                                                                      child: Image
                                                                          .asset(
                                                                        "lib/assets/images/pic_ui/todayTarot.png",
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                        margin: EdgeInsets.all(5
                                                                            .w),
                                                                        child:
                                                                            Text(
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
                                                                margin: EdgeInsets
                                                                    .fromLTRB(
                                                                        10.w,
                                                                        5.h,
                                                                        0,
                                                                        0),
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                height: 45.h,
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(builder:
                                                                            (context) {
                                                                      return PickCard();
                                                                    }));
                                                                  },
                                                                  child: Image
                                                                      .asset(
                                                                    fit: BoxFit
                                                                        .fitHeight,
                                                                    "lib/assets/images/pic_ui/tarotViewDetails.png",
                                                                  ),
                                                                ))
                                                          ],
                                                        ))),
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(0, 0, 30, 0),
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
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    12.sp),
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
                                      } else {
                                        return Container(
                                          decoration:  BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.h)),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'lib/assets/images/pic_ui/tarotTodayTarot.png'),
                                                  fit: BoxFit.cover)),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                10.w,
                                                                10.h,
                                                                0,
                                                                0),
                                                        child: Text(
                                                          'Today Tarot',
                                                          style: TextStyle(
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  238,
                                                                  214,
                                                                  215),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 20.sp),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                10.w,
                                                                10.h,
                                                                0,
                                                                0),
                                                        // color: Colors.black,
                                                        height: 60.h,
                                                        child: InkWell(
                                                            onTap: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              PickCard()));
                                                            },
                                                            child: Stack(
                                                              children: [
                                                                Container(
                                                                    margin: EdgeInsets.fromLTRB(
                                                                        10.w,
                                                                        0,
                                                                        10.w,
                                                                        10.h),
                                                                    height:
                                                                        90.h,
                                                                    width:
                                                                        150.w,
                                                                    child: Lottie.asset(
                                                                        "lib/assets/lottie/tarotButtonBig/data.json",
                                                                        fit: BoxFit
                                                                            .fill)),
                                                                Container(
                                                                  width: 150.w,
                                                                  margin: EdgeInsets
                                                                      .fromLTRB(
                                                                          10.w,
                                                                          0,
                                                                          10.w,
                                                                          10.h),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Text(
                                                                    'Pick Card',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize: 18
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight.bold),
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
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              10.w,
                                                              10.h,
                                                              10.w,
                                                              10.h),
                                                      child: Container(
                                                        height: 120.h,
                                                        width: 180.w,
                                                        // color: Colors.black,
                                                        child: Lottie.asset(
                                                            "lib/assets/lottie/tarotHome/data.json",
                                                            repeat: false),
                                                      ))),
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
          },
        ),
      ),
    );
  }
}
