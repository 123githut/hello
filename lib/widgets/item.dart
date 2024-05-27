import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import '../models/advisor_model.dart';
import '../models/order_model.dart';
import '../pages/counsel_page.dart';
import '../providers/my_favorite_model.dart';

class AdvisorItem extends StatefulWidget {
  final Advisors _advisor;
  const AdvisorItem(this._advisor, {super.key});

  @override
  State<AdvisorItem> createState() => _AdvisorItemState();
}

class _AdvisorItemState extends State<AdvisorItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.h),
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
                          image: AssetImage(
                              'lib/assets/images/pic_ui/tarotCardBg.png'),
                          fit: BoxFit.cover)),
                  margin: EdgeInsets.fromLTRB(
                      10.w, 10.h, 10.w, 0),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets
                            .fromLTRB(10.w, 60.h,
                            10.w, 0),
                        child: Text(
                            widget._advisor
                                .advisorName ??
                                'unknown',
                            style: TextStyle(
                              color: Colors
                                  .white,
                              fontWeight:
                              FontWeight
                                  .bold,
                              fontSize: 20.sp,
                            ),
                            maxLines: 1,
                            overflow:
                            TextOverflow
                                .ellipsis),
                      ),
                      Container(
                        margin:
                        EdgeInsets.all(5.w),
                        child: Text(
                            widget._advisor
                                .advisorDesc ??
                                'unknown',
                            style: TextStyle(
                                color: Colors
                                    .white,
                                fontSize:
                                14.sp),
                            maxLines: 1,
                            overflow:
                            TextOverflow
                                .ellipsis),
                      ),
                      Container(
                          height: 40.h,
                          width: 120.w,
                          margin: EdgeInsets
                              .fromLTRB(5.w, 10.h,
                              10.w, 20.h),
                          decoration:
                          const BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(
                                  5)),
                              gradient:
                              LinearGradient(
                                  begin:
                                  Alignment.centerLeft, //渐变开始于上面的中间开始
                                  end: Alignment.centerRight, //渐变结束于下面的中间
                                  colors: [
                                    Color(
                                        0xFF8B4C9C),
                                    Color(
                                        0xFF7C5EBB)
                                  ])),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Counsel(
                                            widget._advisor.advisorAvatar ?? 'unknown',
                                            widget._advisor.advisorName ?? 'unknown')));
                              },
                              style:
                              ButtonStyle(
                                //设置按钮的大小
                                minimumSize: MaterialStateProperty.all(
                                    const Size(
                                        100,
                                        20)),
                                //设置形状 圆角 半径为8
                                shape:
                                MaterialStateProperty
                                    .all(
                                  const RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(
                                        Radius.circular(8)),
                                  ),
                                ),
                              ),
                              child: Text(
                                "Free 5 Min",
                                style: TextStyle(
                                    color: Colors
                                        .white,
                                    fontSize:
                                    14.sp),
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
                      alignment:
                      Alignment.center,
                      child: Container(
                          height: 100.h,
                          width: 100.w,
                          child: Image.asset(
                              "lib/assets/images/pic_ui/picTarotFram.png"))),
                  Container(
                      alignment:
                      Alignment.center,
                      child: Container(
                          alignment: Alignment
                              .center,
                          height: 62.h,
                          width: 62.w,
                          child: AspectRatio(
                              aspectRatio:
                              1.0,
                              child: ClipOval(
                                child: Image
                                    .network(
                                  widget._advisor
                                      .advisorAvatar ??
                                      'unknown',
                                  fit: BoxFit
                                      .cover,
                                ),
                              )))),
                  Align(
                    child: Container(
                      alignment: Alignment
                          .bottomRight,
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      right: 20,
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors
                                      .white,
                                  width: 2),
                              borderRadius:
                              BorderRadius
                                  .circular(
                                  5),
                              color: Colors
                                  .green),
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

class OrderItem extends StatelessWidget {
  Order order;
  OrderItem(this.order);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10.w),
      width: double.maxFinite,
      height: 125.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 247, 242, 238)),
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(10.w, 5.h, 10.w, 2.h),
                        child: AspectRatio(
                            aspectRatio: 1.0,
                            child: ClipOval(
                              child: Image.network(
                                "${order.advisor?.advisorAvatar}",
                                fit: BoxFit.cover,
                              ),
                            ))),
                    Container(
                      margin: EdgeInsets.all(5.w),
                      child: Text(
                        "${order.advisor?.advisorName}",
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    )
                  ],
                ),
              )),
          Container(
              height: 2.h,
              width: 330.w,
              color: const Color.fromARGB(255, 245, 234, 224)),
          Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(5.w),
                      alignment: Alignment.centerLeft,
                      child: Text('${order.orderId}',
                          style: TextStyle(fontSize: 14.sp)),
                    ),
                    Container(
                      child: Stack(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: EdgeInsets.all(5.h),
                                child: Text('${order.question}',
                                    style: TextStyle(fontSize: 14.sp)),
                              )),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                margin: EdgeInsets.all(5.h),
                                child: Text(
                                    "${DateTime.now().month.toString()}"
                                        "${DateTime.now().day.toString().padLeft(3, ' ')}"
                                        "${DateTime.now().year.toString().padLeft(6, ' ')} ",
                                    style: TextStyle(fontSize: 14.sp)),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
class ItemView extends StatefulWidget {
  final Advisors _advisor;
  const ItemView(this._advisor, {super.key});
  @override
  State<ItemView> createState() => _ItemView(this._advisor);
}

class _ItemView extends State<ItemView> {
  final Advisors _advisor;
  _ItemView(this._advisor);
  @override
  Widget build(BuildContext context) {
    // final favoriteController = Get.put(FavoriteController());
    // favoriteList=favoriteController.list;
    return Container(
      margin: EdgeInsets.all(5.w),
      color: const Color.fromARGB(255, 227, 204, 204),
      child: Stack(
        children: [
          Container(
            child: Stack(
              children: [
                Positioned(
                    child: AspectRatio(
                        aspectRatio: 1.0,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    _advisor.advisorAvatar ??
                                        'unknown',
                                  ),
                                  fit: BoxFit.cover)),
                          height: 120.h,
                        ))),
                Positioned(
                    top: 5.h,
                    right: 5.w,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(2.h),
                          height: 25.h,
                          width: 25.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2)),
                          child: Image.asset(
                              "lib/assets/images/pic_ui/online.png"),
                        ),
                        Container(
                          margin: EdgeInsets.all(2.h),
                          height: 25.h,
                          width: 25.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2)),
                          child: Image.asset(
                              "lib/assets/images/pic_ui/rocket.png"),
                        ),
                        Container(
                          margin: EdgeInsets.all(2.h),
                          height: 25.h,
                          width: 25.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2)),
                          child:
                          Image.asset("lib/assets/images/pic_ui/chat.png"),
                        ),
                        Container(
                          margin: EdgeInsets.all(2.h),
                          height: 25.h,
                          width: 25.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2)),
                          child:
                          Image.asset("lib/assets/images/pic_ui/voice.png"),
                        ),
                        Container(
                          margin: EdgeInsets.all(2.h),
                          height: 25.h,
                          width: 25.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2)),
                          child:
                          Image.asset("lib/assets/images/pic_ui/video.png"),
                        )
                      ],
                    )),
                Positioned(
                  top: 100.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, //设置对齐方式
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(5.w, 5.h, 0, 0),
                          width: 40.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.w),
                              color: const Color.fromARGB(255, 245, 178, 55)),
                          child: Container(
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter, //渐变开始于上面的中间开始
                                    end: Alignment.bottomCenter, //渐变结束于下面的中间
                                    colors: [
                                      Color(0xFFF5AD39),
                                      Color(0xFFFC6548)
                                    ])),
                            alignment: Alignment.center,
                            child: Text(
                              'New',
                              style: TextStyle(
                                 fontSize: 16.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Container(
                        margin: EdgeInsets.fromLTRB(5.w, 5.h, 0, 0),
                        child: Text(
                          _advisor.advisorName ?? 'unknown',
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(5.w, 5.h, 0, 5.w),
                          child: Text(
                            _advisor.advisorDesc ?? 'unknown',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
                Positioned(
                    top: 5,
                    left: 5,
                    child: Container(
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 246, 215, 72)),
                      child: Text(

                        "Top Accuracy",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,),
                      ),
                    )),
                Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.green),
                      height: 14,
                      width: 14,
                    ))
              ],
            ),
          ),
          Positioned(
              top: 175,
              child: Container(
                height: 85,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.h)),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 2.w, 0, 0),
                      width: 180,
                      height: 48,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Text(
                                  '707',
                                  style: TextStyle(
                                      color: const Color.fromARGB(255, 116, 73, 172),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp),
                                ),
                                Text(
                                  'Readings',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12.sp),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 25,
                            width: 1,
                            color: Colors.grey,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Text(
                                  '3.2h',
                                  style: TextStyle(
                                      color: const Color.fromARGB(255, 238, 152, 49),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp),
                                ),
                                Text('Response in',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12.sp))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        height: 28,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 254, 161, 38)),
                        margin: EdgeInsets.fromLTRB(20.w, 0, 20.h, 2.w),
                        width: 140,
                        child: Container(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return Counsel(
                                          _advisor.advisorAvatar ??
                                              'unknown',
                                          _advisor.advisorName ??
                                              'unknown');
                                    }));

                                if (!Provider.of<MyFavorite>(context,
                                    listen: false)
                                    .favoriteAdvisors
                                    .contains(_advisor)) {
                                  Provider.of<MyFavorite>(context,
                                      listen: false)
                                      .addAdvisor(_advisor);
                                  Logger().i('add...');
                                  // favoriteController.add(advisors[_index]);
                                } else {
                                  Provider.of<MyFavorite>(context,
                                      listen: false)
                                      .changeSequence(_advisor);
                                  // favoriteController.modify(advisors[_index]);
                                }
                                // favoriteList=favoriteController.list;
                              },
                              child: Text(
                                'Consult Now',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp),
                              ),
                            )))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}