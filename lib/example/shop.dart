import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyShop());

class MyShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: ShopPage()),
    );
  }
}

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Container(
        color: Color.fromARGB(255, 227, 220, 220),
        child: Column(
          children: [
            Expanded(flex: 1, child: ShopTitle()),
            Expanded(flex: 4, child: Content()),
            Expanded(flex: 1, child: Favorite()),
          ],
        ),
      ),
    );
  }
}

class ShopTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 7,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                    child: Text(
                      "Soulight",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 186, 126, 199)),
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 20, 0, 0),
                        height: 30,
                        width: 30,
                        child:
                            Image.asset("images/order.png", fit: BoxFit.cover),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 20, 0, 0),
                        height: 30,
                        width: 30,
                        child:
                            Image.asset("images/filter.png", fit: BoxFit.cover),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 20, 0, 0),
                        height: 28,
                        width: 28,
                        child:
                            Image.asset("images/search.png", fit: BoxFit.cover),
                      ),
                    ],
                  ))
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
            height: 45,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(7),
                  child: Image.asset("images/signin.png"),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text("Check in everyday to get free bonus"),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Image.asset("images/click.png"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Content extends StatefulWidget {
  @override
  State<Content> createState() => _Content();
}

class _Content extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Container(
        child:  Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
              width: double.maxFinite,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        "https://img2.baidu.com/it/u=1000438822,740354717&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1716310800&t=20405b6f093ae0b5b55403c478e9a640",
                      ),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(3)),
              child:
              Stack(
                children: [
                  Positioned(
                      right: 5,
                      top: 5,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3)),
                            child: Image.asset(
                              "images/online.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3)),
                            child:
                            Image.asset("images/chat.png", fit: BoxFit.cover),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3)),
                            child:
                            Image.asset("images/voice.png", fit: BoxFit.cover),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3)),
                            child:
                            Image.asset("images/video.png", fit: BoxFit.cover),
                          )
                        ],
                      )),
                  Positioned(
                      top: 5,
                      left: 5,
                      child: Container(
                          width: 110,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3)),
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                child: Image.asset("images/diamond.png"),
                              ),
                              Container(
                                child: Text(
                                  'FEATURED',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 246, 215, 72)),
                                ),
                              )
                            ],
                          ))),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 80,
                        width: double.maxFinite,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              height: 60,
                              width: 60,
                              child: Image.asset("images/defaultAvatar.png"),
                            ),
                            Container(
                              height: 80,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      width: 200,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "nei",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                              height: 25,
                                              child:Image.asset("images/star.png",fit: BoxFit.fitHeight,)
                                          ),

                                        ],
                                      )
                                  ),
                                  Container(
                                    child: Text(
                                        maxLines: 5,
                                        "I yearn for freedom  I wanna go home",style: TextStyle(
                                        fontSize: 14,
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
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              height: 50,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('707',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color.fromARGB(255, 116, 73, 172)),),
                        Text('Readings',style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('3.2h',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Color.fromARGB(255, 247, 104, 78))),
                        Text('Response in',style: TextStyle(color: Colors.grey),)
                      ],
                    ),
                  ),
                  Container(
                      child:Container(
                        alignment: Alignment.center,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Color.fromARGB(255, 254, 161, 38)
                        ),
                        height: 30,
                        child: Text('Consult Now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      )
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    height:40,
                    margin:EdgeInsets.all(5),
                    child:Image.asset("images/idea.png") ,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin:EdgeInsets.all(5),
                    child: Text('New Advisor',style: TextStyle(color: Color.fromARGB(255, 233, 116, 95),fontSize: 20),),
                  )

                ],
              ),
            ),
            Container(
              height: 150,
              child: GridView.count(
                crossAxisCount: 2, // 每行显示的列数
                children: List.generate(20, (index) {
                  return Card(
                    margin: EdgeInsets.all(5),
                    child: Container(
                      height: 100,
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );

  }
}

class Favorite extends StatefulWidget {
  @override
  State<Favorite> createState() => _Favorite();
}

class _Favorite extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: Image.asset("images/like.png"),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Text('My Favorites',style: TextStyle(color: Color.fromARGB(255, 221, 62, 116),fontSize: 20),),
              )

            ],
          ),
        ],
      ),
    );
  }
}
