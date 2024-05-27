import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DragListPage(),
    );
  }
}

class DragListPage extends StatefulWidget {
  @override
  _DragListPageState createState() => _DragListPageState();
}

class _DragListPageState extends State<DragListPage> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Draggable(
            feedback: Material(
              child: Transform.scale(
                scale: 1.2,
                child: Container(
                  width: 200, // 设置一个固定的宽度
                  child: ListTile(
                    title: Text(items[index]),
                  ),
                ),
              ),
            ),
            child: ListTile(
              title: Text(items[index]),
            ),
            data: index,
            childWhenDragging: Container(),
          );
        },
      ),
      floatingActionButton: DragTarget(
        builder: (context, candidateData, rejectedData) {
          return FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          );
        },
        onWillAccept: (data) {
          return true;
        },
        onAccept: (data) {
          setState(() {
            items.add('New Item');
          });
        },
      ),
    );
  }
}
