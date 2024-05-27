import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../constants/info.dart';
import '../providers/my_favorite_model.dart';
import '../widgets/item.dart';
import 'counsel_page.dart';


class MyShop extends StatefulWidget {
  @override
  State<MyShop> createState()=>_MyShop();
}

class _MyShop extends State<MyShop>{
  late Shader _shader;
  @override
  void initState() {
    super.initState();
    Gradient gradient = const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color.fromRGBO(182, 111, 203, 1.0),
          Color.fromRGBO(239, 148, 81, 1.0)
        ]);
//根据gradient 创建shader
    _shader =
        gradient.createShader(const Rect.fromLTWH(0, 0, 375, 667));
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child:
      Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(flex: 1,
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                flex: 7,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(15.w, 20.h, 0, 0),
                                  child: Text(
                                    "Soulight",
                                    style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(255, 186, 126, 199)),
                                  ),
                                )),
                            Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(5.w, 20.h, 0, 0),
                                      height: 28.h,
                                      width: 28.w,
                                      child: Image.asset("lib/assets/images/pic_ui/order.png",
                                          fit: BoxFit.cover),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(5.w, 20.h, 0, 0),
                                      height: 30.h,
                                      width: 30.w,
                                      child: Image.asset(
                                          "lib/assets/images/pic_ui/filter.png",
                                          fit: BoxFit.cover),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(5.w, 20.h, 0, 0),
                                      height: 25.h,
                                      width: 25.w,
                                      child: Image.asset(
                                          "lib/assets/images/pic_ui/search.png",
                                          fit: BoxFit.cover),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.h),
                              color: const Color.fromARGB(255, 242, 238, 254)),
                          margin: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 0),
                          height: 35.h,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(10.w, 7.h, 10.w, 7.h),
                                child: Image.asset("lib/assets/images/pic_ui/signin.png"),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                                child: Text(
                                  "Check in everyday to get free bonus",
                                  style: TextStyle(foreground: Paint()..shader = _shader),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(5.w),
                                child: Image.asset("lib/assets/images/pic_ui/click.png"),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              Expanded(flex: 4, child: Container(
                color: const Color.fromARGB(255, 242, 242, 242),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                        width: double.maxFinite,
                        height: 200.h,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: NetworkImage(
                                  "https://img2.baidu.com/it/u=1000438822,740354717&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1716310800&t=20405b6f093ae0b5b55403c478e9a640",
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(3.h)),
                        child: Stack(
                          children: [
                            Positioned(
                                right: 5.w,
                                top: 5.h,
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(5.h),
                                      height: 25.h,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(3.h)),
                                      child: Image.asset(
                                        "lib/assets/images/pic_ui/online.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5.h),
                                      height: 25.h,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(3.h)),
                                      child: Image.asset(
                                          "lib/assets/images/pic_ui/chat.png",
                                          fit: BoxFit.cover),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5.h),
                                      height: 25.h,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(3.h)),
                                      child: Image.asset(
                                          "lib/assets/images/pic_ui/voice.png",
                                          fit: BoxFit.cover),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(5.h),
                                      height: 25.h,
                                      width: 25.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(3.h)),
                                      child: Image.asset(
                                          "lib/assets/images/pic_ui/video.png",
                                          fit: BoxFit.cover),
                                    )
                                  ],
                                )),
                            Positioned(
                                top: 5.h,
                                left: 0,
                                child: Container(
                                    width: 110.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(3.h),
                                        gradient: const LinearGradient(
                                            begin: Alignment.centerLeft, //渐变开始于上面的中间开始
                                            end: Alignment.centerRight, //渐变结束于下面的中间
                                            colors: [
                                              Color(0xFF8B4C9C),
                                              Color(0xFF7C5EBB)
                                            ])),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 20.h,
                                          width: 20.w,
                                          child: Image.asset(
                                              "lib/assets/images/pic_ui/diamond.png"),
                                        ),
                                        Container(
                                          child: Text(
                                            'FEATURED',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                color: Color.fromARGB(255, 246, 215, 72)),
                                          ),
                                        )
                                      ],
                                    ))),
                            Positioned(
                                top: 95.h,
                                right: 20.w,
                                child: Container(
                                  padding: EdgeInsets.all(5.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.h),
                                      color: const Color.fromARGB(255, 246, 215, 72)),
                                  child: Text(
                                    "Top Accuracy",
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp),
                                  ),
                                )),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 80.h,
                                  width: double.maxFinite,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(10.h),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 2.h),
                                            borderRadius: BorderRadius.circular(30.h)),
                                        height: 60.h,
                                        width: 60.w,
                                        child: Stack(
                                          children: [
                                            AspectRatio(
                                              aspectRatio: 1.0,
                                              child: ClipOval(
                                                child: Image.network(
                                                  "https://img2.baidu.com/it/u=1000438822,740354717&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1716310800&t=20405b6f093ae0b5b55403c478e9a640",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                                bottom: 2.h,
                                                right: 2.w,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 2.w),
                                                      borderRadius:
                                                      BorderRadius.circular(5.h),
                                                      color: Colors.green),
                                                  height: 10.w,
                                                  width: 10.h,
                                                ))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 80.h,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                                width: 265.w,
                                                height: 40.h,
                                                child: Stack(
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Positioned(
                                                      top: 5.h,
                                                      left: 5.w,
                                                      child: Text(
                                                        "nei",
                                                        style: TextStyle(
                                                            fontSize: 18.sp,
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                    Positioned(
                                                        top: 5.h,
                                                        right: 35.w,
                                                        height: 20.h,
                                                        child: Image.asset(
                                                          "lib/assets/images/pic_ui/star.png",
                                                          fit: BoxFit.fitHeight,
                                                        )),
                                                    Positioned(
                                                      top: 5.h,
                                                      right: 5.w,
                                                      height: 20.h,
                                                      child: Text(
                                                        "4.5",
                                                        style: TextStyle(
                                                          fontSize: 14.sp,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                            Container(
                                              child: Text(
                                                  maxLines: 5,
                                                  "I yearn for freedom  I wanna go home",
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.normal)),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                        height: 55.h,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.sp), color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 5.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '707',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp,
                                        color: const Color.fromARGB(255, 116, 73, 172)),
                                  ),
                                  Text('Readings', style: TextStyle(color: Colors.grey, fontSize: 16.sp,))
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.grey,
                              width: 1,
                              height: 30,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('3.2h',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp,
                                          color: const Color.fromARGB(255, 247, 104, 78,))),
                                  Text(
                                    'Response in',
                                    style: TextStyle(color: Colors.grey,fontSize: 16.sp),
                                  )
                                ],
                              ),
                            ),
                            Container(
                                child: Container(
                                    alignment: Alignment.center,
                                    width: 150.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color: const Color.fromARGB(255, 254, 161, 38)),
                                    height: 35.h,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) {
                                              return const Counsel(
                                                  'https://img2.baidu.com/it/u=1000438822,740354717&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1716310800&t=20405b6f093ae0b5b55403c478e9a640',
                                                  'nei');
                                            }));
                                      },
                                      child: Text(
                                        'Consult Now',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )))
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Row(
                        children: [
                          Container(
                            height: 35.h,
                            width: 35.h,
                            margin: EdgeInsets.all(5.h),
                            child: Image.asset("lib/assets/images/pic_ui/idea.png"),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(5.h),
                            child: Text(
                              'New Advisor',
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 233, 116, 95),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    SliverGrid(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                        delegate:
                        SliverChildBuilderDelegate((BuildContext context, int index) {
                          return ItemView(advisorList[index]);
                        }, childCount: advisorList.length))
                  ],
                ),
              )),
              Expanded(flex: 1, child: Container(
                height: 120.h,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 30.h,
                          margin: EdgeInsets.all(5.h),
                          child: Image.asset(
                            "lib/assets/images/pic_ui/like.png",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5.h),
                          child: Text(
                            'My Favorites',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 221, 62, 116),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    Container(
                        height: 65.h,
                        child: ListView.builder(
                          itemCount: Provider.of<MyFavorite>(context, listen: true)
                              .favoriteAdvisors
                              .length,
                          itemExtent: 65.h,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 2.h),
                                    height: 40.h,
                                    width: 40.w,
                                    child: ClipOval(
                                      child: Image.network(
                                          Provider.of<MyFavorite>(context, listen: true)
                                              .favoriteAdvisors[index]
                                              .advisorAvatar ??
                                              'unknown'),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 2.h),
                                    child: Text(
                                      Provider.of<MyFavorite>(context, listen: true)
                                          .favoriteAdvisors[index]
                                          .advisorName ??
                                          'unknown',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 12.sp),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ))
                  ],
                ),
              )),
            ],
          ),
        ),

    );
  }
}






