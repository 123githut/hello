import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

void main() => runApp(CounselForm('https://img2.baidu.com/it/u=266502902,2994849157&fm=253&fmt=auto&app=138&f=JPEG?w=400&h=400','jjjj'));

class CounselForm extends StatelessWidget {
  final String _advisorAvatar;
  final String _advisorName;
  CounselForm(this._advisorAvatar, this._advisorName);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Counsel(_advisorAvatar, _advisorName)),
      ),
    );
  }
}

class Counsel extends StatelessWidget {
  final String _advisorAvatar;
  final String _advisorName;
  Counsel(this._advisorAvatar, this._advisorName);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          onTap: () {
            // 点击背景关闭键盘
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              CounselTitle(),
              Expanded(
                  child: Column(
                    children: [
                      AdvisorInfo(_advisorAvatar, _advisorName),
                      Expanded(child: QuestionInfo()),
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
          title: Text('Leave Counsel Page'),
          content: Text('Are you sure you want to leave this page?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // 取消对话框
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // 确认对话框并返回
              },
              child: Text('Yes'),
            ),
          ],
        );
      }).then((value) {
    if (value == true) {
      Navigator.pop(context); // 返回上一页并传递true
    }
  });
}

class CounselTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 245, 234, 224),
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  showExitDialog(context);
                },
                child: Icon(Icons.arrow_back),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Counseling form",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdvisorInfo extends StatelessWidget {
  final String advisorAvatar;
  final String advisorName;

  AdvisorInfo(this.advisorAvatar, this.advisorName);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: ClipOval(
                child: Image.network(advisorAvatar),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              advisorName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class QuestionInfo extends StatefulWidget {
  @override
  State<QuestionInfo> createState() => _QuestionInfo();
}

class _QuestionInfo extends State<QuestionInfo> with WidgetsBindingObserver{
  TextEditingController _inputQuestionController =
  TextEditingController(); // 输入框监听
  TextEditingController _inputSituationController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  FocusNode _focusNode=new FocusNode();//焦点
  int _maxLength = 10; // 设置对话框初始maxLength
  Color _countColor = Colors.grey;
  Color _buttonColor = Colors.grey;
  int _situationCounter = 0;
  int _questionCounter = 0;
  double _keyboardHeight=0;

  @override
  void initState() {
    super.initState();
    _inputQuestionController.addListener(_updateQuestionCounter);
    _inputSituationController.addListener(_updateSituationCounter);

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 焦点聚焦的状况下
      if (_focusNode.hasFocus) {
        if (MediaQuery.of(context).viewInsets.bottom > 0) {
          Logger().i("listening...");
          setState(() {
            _keyboardHeight=260;
            Logger().i(_keyboardHeight);
            _scrollToFocusedInput();
          });
        }
      }
    });
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
      _buttonColor = Color.fromARGB(255, 157, 187, 199);
    } else {
      _buttonColor = Colors.grey;
    }
  }

  void _updateSituationCounter() {
    _situationCounter = _inputSituationController.text.length;
  }

  @override
  void dispose() {
    _inputQuestionController.removeListener(_updateQuestionCounter);
    _inputSituationController.removeListener(_updateSituationCounter);
    _inputQuestionController.dispose();
    _inputSituationController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _scrollToFocusedInput() {
    Future.delayed(Duration(milliseconds: 50), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 50),
          curve: Curves.easeInOut,
        );
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView(controller:_scrollController,padding: EdgeInsets.only(bottom: _keyboardHeight),physics: BouncingScrollPhysics(), children: [
      Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
              alignment: Alignment.centerLeft,
              child: Text(
                "hh",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
              alignment: Alignment.centerLeft,
              child: Text(
                "yang lei",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 330,
              height: 1,
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              alignment: Alignment.centerLeft,
              color: Color.fromARGB(255, 245, 234, 224),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                "General Situation",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                controller: _inputSituationController,
                maxLines: 5,
                decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 246, 246, 246),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.transparent, // 颜色透明
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.transparent, // 颜色透明
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.transparent, // 颜色透明
                    ),
                  ),
                  hintText:
                  'Describe your situation in certain sentences to help your advisor know better your status to further improve the quality of service',
                  hintStyle:
                  TextStyle(color: Color.fromARGB(255, 178, 178, 178)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Specific Question",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                controller: _inputQuestionController,
                focusNode: _focusNode,
                maxLength: _maxLength,
                maxLines: 1,
                decoration: InputDecoration(
                  counter: Container(),
                  // 隐藏默认计数器
                  fillColor: Color.fromARGB(255, 246, 246, 246),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.transparent, // 颜色透明
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.transparent, // 颜色透明
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.transparent, // 颜色透明
                    ),
                  ),
                  hintText: "One question only",
                  hintStyle:
                  TextStyle(color: Color.fromARGB(255, 178, 178, 178)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
              alignment: Alignment.centerRight,
              child: Text(
                '${_inputQuestionController.text.length}/10',
                style: TextStyle(color: _countColor),
              ),
            ),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: _buttonColor,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 140,
                          child: Container(
                            child: Image.asset(
                              "images/coin.png",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 5,
                          left: 175,
                          child: Text(
                            '30',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    ]);
  }
}
