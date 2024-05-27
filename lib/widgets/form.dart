import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CounselForm extends StatefulWidget {
  @override
  State<CounselForm> createState() => _CounselForm();
}

class _CounselForm extends State<CounselForm> {
  final TextEditingController _inputQuestionController =
  TextEditingController(); // 输入框监听
  final TextEditingController _inputSituationController = TextEditingController();
  int _maxLength = 10; // 设置对话框初始maxLength
  Color _countColor = Colors.grey;
  Color _buttonColor = Colors.grey;
  int _situationCounter = 0;
  int _questionCounter = 0;
  bool isSubmit=false;

  @override
  void initState() {
    super.initState();
    _inputSituationController.addListener(_updateSituationCounter);
    _inputQuestionController.addListener(_updateQuestionCounter);
  }

  void _updateSituationCounter() {
    _situationCounter = _inputSituationController.text.length;
    if (_questionCounter > 0 && _situationCounter > 0) {
      isSubmit=true;
      setState(() {
        _buttonColor = const Color.fromARGB(255, 157, 187, 199);
      });
    } else {
      isSubmit=false;
      setState(() {
        _buttonColor = Colors.grey;
      });
    }
  }

  void _updateQuestionCounter() {
    _questionCounter = _inputQuestionController.text.length;
    if (_questionCounter >= _maxLength) {
      // maxLength动态增加
      setState(() {
        _maxLength = _questionCounter + 10;
      });
    }
    if (_questionCounter > 10) {
      setState(() {
        _countColor = Colors.red;
      });
    } else {
      setState(() {
        _countColor = Colors.grey;
      });
    }
    if (_questionCounter > 0 && _situationCounter > 0) {
      isSubmit=true;
      setState(() {
        _buttonColor = const Color.fromARGB(255, 157, 187, 199);
      });
    } else {
      isSubmit=false;
      setState(() {
        _buttonColor = Colors.grey;
      });
    }
  }

  @override
  void dispose() {
    _inputQuestionController.removeListener(_updateQuestionCounter);
    _inputSituationController.removeListener(_updateSituationCounter);
    _inputQuestionController.dispose();
    _inputSituationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(physics: const BouncingScrollPhysics(), children: [
      Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10.w, 0, 0, 5.h),
              alignment: Alignment.centerLeft,
              child: Text(
                "Name",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.w, 5.h, 0, 5.h),
              alignment: Alignment.centerLeft,
              child: Text(
                "yang lei",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 330.w,
              height: 1,
              margin: EdgeInsets.fromLTRB(10.w, 5.h, 10.w, 5.h),
              alignment: Alignment.centerLeft,
              color: const Color.fromARGB(255, 245, 234, 224),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.w, 5.h, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                "General Situation",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 0),
              child: TextField(
                controller: _inputSituationController,
                maxLines: 5,
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 246, 246, 246),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0.h),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0.h),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0.h),
                    borderSide: const BorderSide(
                      color: Colors.transparent, // 颜色透明
                    ),
                  ),
                  hintText:
                  'Describe your situation in certain sentences to help your advisor know better your status to further improve the quality of service',
                  hintStyle:
                  TextStyle(color: const Color.fromARGB(255, 178, 178, 178),fontSize: 14.sp),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.w, 10.h, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Specific Question",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 0),
              child: TextField(
                controller: _inputQuestionController,
                maxLength: _maxLength,
                maxLines: 1,
                decoration: InputDecoration(
                  counter: Container(),
                  // 隐藏默认计数器
                  fillColor: const Color.fromARGB(255, 246, 246, 246),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  hintText: "One question only",
                  hintStyle:
                  TextStyle(color: const Color.fromARGB(255, 178, 178, 178),fontSize: 14.sp),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 20.h, 0),
              alignment: Alignment.centerRight,
              child: Text(
                '${_inputQuestionController.text.length}/10',
                style: TextStyle(color: _countColor,fontSize: 14.sp),
              ),
            ),
            Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: _buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(20.h))),
                margin: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
                child: InkWell(
                  onTap: (){

                    if(!isSubmit){
                      Fluttertoast.showToast(
                        msg: "please enter the content before submitting",
                        gravity: ToastGravity.BOTTOM,
                        toastLength: Toast.LENGTH_SHORT,
                        fontSize: 16.0,
                      );
                    }else{
                      Fluttertoast.showToast(
                        msg: "submitting......",
                        gravity: ToastGravity.BOTTOM,
                        toastLength: Toast.LENGTH_SHORT,
                        fontSize: 16.0,
                      );
                      //提交订单数据到本地

                    }
                  },
                  child: Column(
                    children: [
                      Container(
                        margin:EdgeInsets.fromLTRB(0, 5.h, 0, 5.h),
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white, fontSize: 16.sp,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin:EdgeInsets.only(bottom: 5.h),
                        height: 25.h,
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 140.w,
                              child: Container(
                                alignment: Alignment.center,
                                height: 20.h,
                                width: 20.w,
                                child: Image.asset(
                                  "lib/assets/images/pic_ui/coin.png",
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 165.w,
                              child: Text(
                                '30',
                                style: TextStyle(color: Colors.white,fontSize: 16.sp),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    ]);
  }
}