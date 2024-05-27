import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/form.dart';

class Counsel extends StatefulWidget {
  final String _advisorAvatar;
  final String _advisorName;
  const Counsel(this._advisorAvatar, this._advisorName, {super.key});

  @override
  State<Counsel> createState() =>_Counsel(this._advisorAvatar,this._advisorName);
}

class _Counsel extends State<Counsel>{
  final String _advisorAvatar;
  final String _advisorName;
  _Counsel(this._advisorAvatar, this._advisorName);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: GestureDetector(
          onTap: () {
            // 点击背景关闭键盘
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 245, 234, 224),
                child: Container(
                  margin: EdgeInsets.fromLTRB(10.w, 20.h, 10.w, 10.h),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            showExitDialog(context);
                          },
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Counseling form",
                          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5.w),
                        child: Row(
                          children: [
                            Container(
                              height: 50.w,
                              width: 50.h,
                              margin: EdgeInsets.fromLTRB(10.w, 0, 0, 0),
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                child: ClipOval(
                                  child: Image.network(_advisorAvatar,fit: BoxFit.fill,),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
                              child: Text(
                                _advisorName,
                                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: CounselForm()),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

void showExitDialog(BuildContext context) {
  showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Leave Counsel Page'),
          content: const Text('Are you sure you want to leave this page?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // 取消对话框
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // 确认对话框并返回
              },
              child: const Text('Yes'),
            ),
          ],
        );
      }).then((value) {
    if (value == true) {
      Navigator.pop(context); // 返回上一页并传递true
    }
  });
}



